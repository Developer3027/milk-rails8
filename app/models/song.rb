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

  private

  def associate_album_artist
    if artist.present? && album.present?
      album.artist = artist
    end
  end
end
