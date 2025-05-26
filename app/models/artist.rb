class Artist < ApplicationRecord
  has_one_attached :image
  has_many :songs, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres
end
