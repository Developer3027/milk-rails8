class UpdateSongsSchema < ActiveRecord::Migration[8.0]
  def change
    rename_column :songs, :image_url, :song_image_url
    rename_column :songs, :file_url, :song_file_url
    remove_column :songs, :artist, :string
    remove_column :songs, :album, :string
  end
end
