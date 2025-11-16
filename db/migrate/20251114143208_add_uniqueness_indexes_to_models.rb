class AddUniquenessIndexesToModels < ActiveRecord::Migration[8.0]
  def up
    # Clean up duplicate artists
    cleanup_duplicate_artists

    # Clean up duplicate genres
    cleanup_duplicate_genres

    # Clean up duplicate albums
    cleanup_duplicate_albums

    # Add unique indexes
    add_index :artists, :name, unique: true
    add_index :genres, :name, unique: true
    add_index :albums, [ :title, :artist_id ], unique: true
  end

  def down
    remove_index :artists, :name
    remove_index :genres, :name
    remove_index :albums, [ :title, :artist_id ]
  end

  private

  def cleanup_duplicate_artists
    # Group artists by lowercase name, keep first, merge others
    duplicates = Artist.all.group_by { |a| a.name.downcase }
    duplicates.each do |name, artists|
      next if artists.size == 1

      keeper = artists.first
      artists[1..].each do |duplicate|
        # Reassign all songs to the keeper
        Song.where(artist_id: duplicate.id).update_all(artist_id: keeper.id)
        # Reassign all albums to the keeper
        Album.where(artist_id: duplicate.id).update_all(artist_id: keeper.id)
        # Delete the duplicate
        duplicate.reload.destroy
      end
    end
  end

  def cleanup_duplicate_genres
    duplicates = Genre.all.group_by { |g| g.name.downcase }
    duplicates.each do |name, genres|
      next if genres.size == 1

      keeper = genres.first
      genres[1..].each do |duplicate|
        # First, update albums (has FK constraint, so do this before destroy)
        Album.where(genre_id: duplicate.id).update_all(genre_id: keeper.id)
        # Update song_genres join table
        SongGenre.where(genre_id: duplicate.id).update_all(genre_id: keeper.id)
        # Now safe to delete the duplicate (reload to avoid FK issues)
        duplicate.reload.destroy
      end
    end
  end

  def cleanup_duplicate_albums
    # Group by title + artist_id (case insensitive on title)
    duplicates = Album.all.group_by { |a| [ a.title.downcase, a.artist_id ] }
    duplicates.each do |key, albums|
      next if albums.size == 1

      keeper = albums.first
      albums[1..].each do |duplicate|
        # Reassign all songs to the keeper
        Song.where(album_id: duplicate.id).update_all(album_id: keeper.id)
        # Delete the duplicate
        duplicate.reload.destroy
      end
    end
  end
end
