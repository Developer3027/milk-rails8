class MakeAlbumIdOptionalInSongs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :songs, :album_id, true
  end
end
