class Song < ApplicationRecord
  has_one_attached :song_image
  has_one_attached :song_file
end
