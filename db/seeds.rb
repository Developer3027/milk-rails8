# Seed file for music production

# Clear existing data (optional - only if you want to start fresh)
[ SongGenre, Song, Album, Artist, Genre ].each(&:destroy_all)

artists_data = [
  {
    name: "Chris Rea",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/chris_rea/chris_rea-artist.jpeg",
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
  },
  {
    name: "David Lee Roth",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/david_lee_roth/david_lee_roth-artist.jpeg",
    albums: [
      {
        title: "Skyscraper",
        release_year: 1988,
        genre_name: "Hard Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/david_lee_roth/Skyscraper_(David_Lee_Roth_album_-_cover_art).jpg",
        songs: [
          {
            title: "Hina",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/david_lee_roth/hina.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/david_lee_roth/Hina.mp3"
          },
          {
            title: "Skyscraper",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/david_lee_roth/skyscraper.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/david_lee_roth/Skyscraper.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Dream on Dreamer",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/dream_on_dreamer/dream_on_dreamer-artist.jpeg",
    albums: [
      {
        title: "It Comes and Goes",
        release_year: 2018,
        genre_name: "Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/dream_on_dreamer/runaway.jpeg",
        songs: [
          {
            title: "Runaway",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/dream_on_dreamer/runaway.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/dream_on_dreamer/runaway.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Aoshi",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/flutter/fluttershy.png",
    albums: [
      {
        title: "Flutter",
        release_year: 2016,
        genre_name: "Electronic",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/flutter/flutter.jpg",
        songs: [
          {
            title: "Flutter",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/flutter/flutter.jpg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/flutter/flutter.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Stevie Nicks",
    image_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/stevie_nicks/stevie_nicks-artist.jpeg",
    albums: [
      {
        title: "Heavy Metal",
        release_year: 2016,
        genre_name: "Rock",
        cover_art_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/stevie_nicks/heavy_metal-album.jpeg",
        songs: [
          {
            title: "Blue Lamp",
            song_image_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/stevie_nicks/heavy-metal.jpg",
            song_file_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/stevie_nicks/blue-lamp.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Don Felder",
    image_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/don_felder/don_felder-artist.jpeg",
    albums: [
      {
        title: "Heavy Metal",
        release_year: 2016,
        genre_name: "Rock",
        cover_art_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/don_felder/heavy_metal-album.jpeg",
        songs: [
          {
            title: "All Of You",
            song_image_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/don_felder/heavy-metal.jpg",
            song_file_path: "https://milk-blog.s3.us-east-2.amazonaws.com/music/don_felder/All-Of-You.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Kaskade",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/kaskade/kaskade-artist.jpeg",
    albums: [
      {
        title: "Strobelite Seduction",
        release_year: 2008,
        genre_name: "Electronic",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/kaskade/kaskade.jpg",
        songs: [
          {
            title: "Move for Me",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/kaskade/kaskade.jpg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/kaskade/move for me.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Korn",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/korn-artist.jpeg",
    albums: [
      {
        title: "The Paradigm Shift",
        release_year: 2014,
        genre_name: "Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/The Paradigm Shift/spike in my veins.jpeg",
        songs: [
          {
            title: "Spike in My Veins",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/The Paradigm Shift/spike in my veins.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/The Paradigm Shift/Spike in My Veins.mp3"
          }
        ]
      },
      {
        title: "Untitled",
        release_year: 2014,
        genre_name: "Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/untitled/evolution.png",
        songs: [
          {
            title: "Spike in My Veins",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/untitled/evolution.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Korn/untitled/evolution.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "TSS",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/tss/tss-artist.jpeg",
    albums: [
      {
        title: "TSS",
        release_year: 2024,
        genre_name: "Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/tss/killing-me.jpeg",
        songs: [
          {
            title: "Spike in My Veins",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/tss/killing-me.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/tss/killing me.mp3"
          },
          {
            title: "Spike in My Veins",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/tss/fantasize.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/tss/fantasize.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Van Halen",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/van+halen/Van_Halen_-_1984.jpg",
    albums: [
      {
        title: "Strobelite Seduction",
        release_year: 2008,
        genre_name: "Electronic",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/van+halen/Van_Halen_-_1984.jpg",
        songs: [
          {
            title: "Move for Me",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/van+halen/Van_Halen_-_1984.jpg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/van+halen/1984.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Linkin Park",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/Linkin_Park-artist.jpeg",
    albums: [
      {
        title: "From Zero",
        release_year: 2024,
        genre_name: "Alt Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/From+Zero/from zero.jpeg",
        songs: [
          {
            title: "heavy is the crown",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/From+Zero/from zero.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/From+Zero/heavy is the crown.mp3"
          },
          {
            title: "two faced",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/From+Zero/from zero.jpeg",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/From+Zero/two faced.mp3"
          }
        ]
      },
      {
        title: "Reanimation",
        release_year: 2002,
        genre_name: "Alt Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/reanimation.png",
        songs: [
          {
            title: "Opening",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/reanimation.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/opening.mp3"
          },
          {
            title: "Frgt/10",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/reanimation.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/Frgt10.mp3"
          },
          {
            title: "My<Dsmbr",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/reanimation.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/My<Dsmbr.mp3"
          },
          {
            title: "P5hng Mie A*wy",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/reanimation.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/P5hng Mie A*wy.mp3"
          },
          {
            title: "ppr:kut",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin park/reanimation/reanimation.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/linkin+park/reanimation/ppr:kut.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Pink Floyd",
    image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Pink_Floyd/A+Momentary+Lapse+of+Reason/Screenshot+from+2025-05-26+20-31-37.png",
    albums: [
      {
        title: "A Momentary Lapse of Reason",
        release_year: 1987,
        genre_name: "Rock",
        cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Pink_Floyd/A+Momentary+Lapse+of+Reason/Screenshot+from+2025-05-26+20-31-37.png",
        songs: [
          {
            title: "Signs of Life",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Pink_Floyd/A+Momentary+Lapse+of+Reason/Screenshot+from+2025-05-26+20-31-37.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Pink_Floyd/A+Momentary+Lapse+of+Reason/Signs+of+Life.mp3"
          },
          {
            title: "Learning to Fly",
            song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Pink_Floyd/A+Momentary+Lapse+of+Reason/Screenshot+from+2025-05-26+20-31-37.png",
            song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/music/Pink_Floyd/A+Momentary+Lapse+of+Reason/Learning+to+Fly.mp3"
          }
        ]
      }
    ]
  }
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
