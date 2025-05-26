# db/migrate/XXXXXX_add_artist_and_album_to_songs.rb
def change
  add_reference :songs, :artist, foreign_key: true, null: true  # Allow null temporarily
  add_reference :songs, :album, foreign_key: true, null: true  # Allow null temporarily
end
