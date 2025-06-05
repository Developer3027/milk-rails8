# Seed file for music production

# Clear existing data (optional - only if you want to start fresh)
[ SongGenre, Song, Album, Artist, Genre ].each(&:destroy_all)

artists_data = [
  {
    name: "Chris Rea",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/achris_rea/chris_rea-artist.jpeg",
    albums: [
      {
        title: "Josephine",
        release_year: 1985,
        genre_name: "Blues Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/chris_rea/josephine-s-m.jpg",
        songs: [
          {
            title: "Josephine",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/chris_rea/josephine.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/chris_rea/josephine.mp3"
          }
        ]
      }
    ]
  }
  # {
  #   name: "David Lee Roth",
  #   image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/azdybnxo2pwz9hlt6nmga6xeye1q",
  #   albums: [
  #     {
  #       title: "Skyscraper",
  #       release_year: 1988,
  #       genre_name: "Hard Rock",
  #       cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/9hodqq19l9yxxiuhplixo6cc4llk",
  #       songs: [
  #         {
  #           title: "Hina",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/37iw8fw4qy1c88e72e8ehijmx7m4",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/oeh2m9zydf8n2jphz7b6pe1bcys3"
  #         },
  #         {
  #           title: "Skyscraper",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/jbu8uugz2agtlsy9ito9rujbdad2",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/8ztwb3w1yi6dj4uex6o760qdb0vc"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Dream on Dreamer",
  #   image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/1onawjda2x4gleu4mzzw2wdy5bbm",
  #   albums: [
  #     {
  #       title: "It Comes and Goes",
  #       release_year: 2018,
  #       genre_name: "Rock",
  #       cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/lrqa4ndcwk2tapyio4mcwpnbjxbr",
  #       songs: [
  #         {
  #           title: "Runaway",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/6vxmxdxcav1zw24vjt4sqi3ooizu",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/1i47vv4q838wely9i3sc4zj1evl3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Aoshi",
  #   image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/iybac3ah0zvsvj46c7cwo0237swa",
  #   albums: [
  #     {
  #       title: "Flutter",
  #       release_year: 2016,
  #       genre_name: "Electronic",
  #       cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/u3ri4d0q9ga02g7k84ol1chfh97m",
  #       songs: [
  #         {
  #           title: "Flutter",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/7ggia9sx6okb7o46c8ybqog3rrrg",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/zjni9q9u1uonjiasf8cl9jhierkd"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Stevie Nicks",
  #   image_path: "stevie_nicks/stevie_nicks-artist.jpeg",
  #   albums: [
  #     {
  #       title: "Heavy Metal",
  #       release_year: 2016,
  #       genre_name: "Rock",
  #       cover_art_path: "stevie_nicks/heavy_metal-album.jpeg",
  #       songs: [
  #         {
  #           title: "Blue Lamp",
  #           song_image_path: "stevie_nicks/heavy-metal.jpg",
  #           song_file_path: "stevie_nicks/blue-lamp.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Don Felder",
  #   image_path: "don_felder/don_felder-artist.jpeg",
  #   albums: [
  #     {
  #       title: "Heavy Metal",
  #       release_year: 2016,
  #       genre_name: "Rock",
  #       cover_art_path: "don_felder/heavy_metal-album.jpeg",
  #       songs: [
  #         {
  #           title: "All-Of-You",
  #           song_image_path: "don_felder/heavy-metal.jpg",
  #           song_file_path: "don_felder/All-Of-You.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Kaskade",
  #   image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/b0vjjnk5xf9a2kbpwgf6zgwp8qxh",
  #   albums: [
  #     {
  #       title: "Strobelite Seduction",
  #       release_year: 2008,
  #       genre_name: "Electronic",
  #       cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/yvoyeh37drdkfsctewa1y5gvdy06",
  #       songs: [
  #         {
  #           title: "Move for Me",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/jb7zlvoxhdzyvde2jrbepev6f4np",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/eao2k8cgzwi5vl0nsonmgd3dftar"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Korn",
  #   image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/omzvvg1cxacxcsxserubaslboboy",
  #   albums: [
  #     {
  #       title: "The Paradigm Shift",
  #       release_year: 2014,
  #       genre_name: "Rock",
  #       cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/h2bjg215g2xq7fla9tm45krffv1y",
  #       songs: [
  #         {
  #           title: "Spike in My Veins",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/oo2r3ljl4m04kdlo1q9u6hu985bh",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/doyn7rwryl1befy81c464i8okqhy"
  #         }
  #       ]
  #     }
  #   ]
  # }
]

artists_data.each do |artist_data|
  # Create or find the artist
  artist = Artist.find_or_create_by!(name: artist_data[:name]) do |a|
    a.image_url = artist_data[:image_url]
  end

  artist_data[:albums].each do |album_data|
    # Find or create the genre
    genre = Genre.find_or_create_by!(name: album_data[:genre_name])

    # Create the album
    album = Album.find_or_create_by!(title: album_data[:title], artist: artist) do |a|
      a.release_year = album_data[:release_year]
      a.genre = genre
      a.cover_art_url = album_data[:cover_art_url]
    end

    album_data[:songs].each do |song_data|
      # Create the song
      song = Song.find_or_create_by!(title: song_data[:title], album: album, artist: artist) do |s|
        s.song_image_url = song_data[:song_image_url]
        s.song_file_url = song_data[:song_file_url]
      end

      # Create SongGenre association
      SongGenre.find_or_create_by!(song: song, genre: genre)
    end
  end
end

puts "Seeded #{Artist.count} artists, #{Album.count} albums, and #{Song.count} songs with #{Genre.count} genres."
