class RemoveUrlsFromSongs < ActiveRecord::Migration[8.0]
  def change
    remove_column :songs, :song_image_url, :string
    remove_column :songs, :song_file_url, :string
  end
end
