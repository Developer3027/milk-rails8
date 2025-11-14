class Song < ApplicationRecord
  has_one_attached :image
  has_one_attached :audio_file
  belongs_to :artist
  belongs_to :album, optional: true, inverse_of: :songs

  accepts_nested_attributes_for :artist, :album

  has_many :song_genres, dependent: :destroy
  has_many :genres, through: :song_genres

  delegate :name, to: :artist, prefix: true
  delegate :title, to: :album, prefix: true

  before_validation :associate_album_artist

  # Generate mobile-optimized square crop based on focal point
  def mobile_image_variant
    return unless image.attached?

    # For mobile: create 640x640 retina-friendly square crop centered on focal point
    crop_params = calculate_mobile_crop

    image.variant(
      crop: crop_params,
      resize_to_limit: [640, 640],
      format: :webp
    )
  end

  private

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
    left = [[fx - target_size / 2, 0].max, source_width - target_size].min
    top = [[fy - target_size / 2, 0].max, source_height - target_size].min

    # Return libvips crop format: [left, top, width, height]
    [left.to_i, top.to_i, target_size, target_size]
  end

  def associate_album_artist
    if artist.present? && album.present?
      album.artist = artist
    end
  end
end
