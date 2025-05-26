class AddArtistAndAlbumToSongs < ActiveRecord::Migration[8.0]
  def up
    # Drop the old table (destructive! Only do this if you don't need the data.)
    drop_table :songs

    # Recreate the table with artist and album references
    create_table :songs do |t|
      t.string :artist
      t.string :album
      t.string :title
      t.string :song_image_url
      t.string :song_file_url
      t.references :artist, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      # Add other columns your app needs (duration, track_number, etc.)
      t.timestamps
    end
  end

  def down
    # Rollback: Drop the new table and recreate the old structure (if needed)
    drop_table :songs

    # Example of old structure (adjust based on your original schema)
    create_table :songs do |t|
      t.string :title
      # ... other columns that existed before ...
      t.timestamps
    end
  end
  def change
    add_reference :songs, :artist, null: false, foreign_key: true
    add_reference :songs, :album, null: false, foreign_key: true
  end
end
