class RemoveArtUrlFromAlbums < ActiveRecord::Migration[8.0]
  def change
    remove_column :albums, :cover_art_url, :string
  end
end
