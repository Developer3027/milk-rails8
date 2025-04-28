class Hermit < ApplicationRecord
  has_many :hermit_videos, dependent: :destroy
  has_rich_text :info
  has_one_attached :alias_image
  has_one_attached :skin_image
  has_one_attached :face_image
end
