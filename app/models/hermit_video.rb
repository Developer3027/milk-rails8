class HermitVideo < ApplicationRecord
  belongs_to :hermit
  has_rich_text :description

  validates :youtube_video_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :season, presence: true, numericality: { only_integer: true }
  validates :episode, presence: true, numericality: { only_integer: true }

  # Construct the YouTube video URL
  def youtube_url
    "https://youtu.be/#{youtube_video_id}"
  end
end
