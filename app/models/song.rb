class Song < ApplicationRecord
  has_one_attached :image
  has_one_attached :audio_file
  belongs_to :artist
  belongs_to :album, optional: true, inverse_of: :songs

  has_many :song_genres, dependent: :destroy
  has_many :genres, through: :song_genres

  delegate :name, to: :artist, prefix: true
  delegate :title, to: :album, prefix: true

  before_validation :process_nested_attributes
  before_validation :associate_album_artist

  # Store nested attributes for processing in callback
  attr_accessor :pending_artist_attributes, :pending_album_attributes

  # Override nested attribute setters to store data for later processing
  def artist_attributes=(attributes)
    @pending_artist_attributes = attributes
  end

  def album_attributes=(attributes)
    @pending_album_attributes = attributes
  end

  # Check if song has any attribution data
  def has_credits?
    image_credit.present? || image_credit_url.present? ||
    audio_source.present? || additional_credits.present?
  end

  # Generate mobile-optimized square crop based on focal point
  def mobile_image_variant
    return unless image.attached?

    # For mobile: create 640x640 retina-friendly square crop centered on focal point
    crop_params = calculate_mobile_crop

    image.variant(
      crop: crop_params,
      resize_to_limit: [ 640, 640 ],
      format: :webp
    )
  end

  private

  # Process nested attributes in the correct order
  def process_nested_attributes
    # Skip if no pending attributes
    return unless @pending_artist_attributes.present? || @pending_album_attributes.present?

    # Process artist first
    if @pending_artist_attributes && @pending_artist_attributes[:name].present?
      self.artist = Artist.find_or_create_by(name: @pending_artist_attributes[:name])
    end

    # Then process album (now that artist is set)
    if @pending_album_attributes && @pending_album_attributes[:title].present?
      # Handle nested genre
      genre = if @pending_album_attributes[:genre_attributes] &&
                 @pending_album_attributes[:genre_attributes][:name].present?
        Genre.find_or_create_by(name: @pending_album_attributes[:genre_attributes][:name])
      else
        nil
      end

      # Find or create album
      # Album uniqueness is scoped to title + artist only, so we find/create by those
      # Then update the genre if needed
      if self.artist && genre
        album = Album.find_or_initialize_by(
          title: @pending_album_attributes[:title],
          artist_id: self.artist.id
        )

        # Set or update the genre
        album.genre_id = genre.id if album.genre_id != genre.id

        # Save the album if it's new or changed
        album.save if album.new_record? || album.changed?

        # Explicitly set the album_id to ensure Rails tracks the change
        self.album_id = album.id if album.persisted?
      end
    end

    # Clear pending attributes to avoid reprocessing
    @pending_artist_attributes = nil
    @pending_album_attributes = nil
  end

  def calculate_mobile_crop
    # Source dimensions (adjust these if your images have different dimensions)
    source_width = 1024
    source_height = 574
    target_size = 574 # Square crop

    # Get focal point (defaults to center if not set)
    fx = (focal_point_x || 0.5) * source_width
    fy = (focal_point_y || 0.5) * source_height

    # Calculate crop box centered on focal point
    # Ensure crop box stays within image bounds
    left = [ [ fx - target_size / 2, 0 ].max, source_width - target_size ].min
    top = [ [ fy - target_size / 2, 0 ].max, source_height - target_size ].min

    # Return libvips crop format: [left, top, width, height]
    [ left.to_i, top.to_i, target_size, target_size ]
  end

  def associate_album_artist
    # Album artist is already set by find_or_create_by in process_nested_attributes
    # This callback ensures consistency but doesn't save to avoid validation loops
    if artist.present? && album.present? && album.artist_id != artist.id
      album.artist = artist
    end
  end
end
