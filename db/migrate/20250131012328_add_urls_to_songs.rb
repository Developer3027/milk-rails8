class AddUrlsToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :image_url, :string
    add_column :songs, :file_url, :string
  end
end
