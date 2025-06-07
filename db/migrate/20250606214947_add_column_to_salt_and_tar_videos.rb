class AddColumnToSaltAndTarVideos < ActiveRecord::Migration[8.0]
  def change
    add_column :salt_and_tar_videos, :youtube_url, :string
  end
end
