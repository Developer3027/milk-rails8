# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Destroy all Blogs
Blog.destroy_all
p "#{Blog.count} Blogs left"

# Destroy Milk Admin
MilkAdmin.destroy_all
p "#{MilkAdmin.count} Admins left"

# Log Milk Admin
MilkAdmin.create!(email: "admin@example.com", password: "admin456", password_confirmation: "admin456")
p "Created Admin"

# Delete all pills
Pill.destroy_all
p "#{Pill.count} Pills left"

# Create initial Pills
Pill.create!(skill: "HTML", version: "Semantic V5", version_color: "#03B844", group: "Web")
Pill.create!(skill: "CSS", version: "Style Sheets V3", version_color: "#03B844", group: "Web")
Pill.create!(skill: "JS", version: "ES14", version_color: "#03B844", group: "Web")

Pill.create!(skill: "Git", version: "Git V2.34.1", version_color: "#CDC1FF", group: "Version Control")
Pill.create!(skill: "Github", version: "Latest", version_color: "#CDC1FF", group: "Version Control")
Pill.create!(skill: "Gitlab", version: "Latest", version_color: "#CDC1FF", group: "Version Control")

Pill.create!(skill: "Windows", version: "Win 10", version_color: "#FFAAAA", group: "Operating System")
Pill.create!(skill: "Linux", version: "Ubuntu 22", version_color: "#FFAAAA", group: "Operating System")

Pill.create!(skill: "ReactJs", version: "Javascript V16.8", version_color: "#15BDFF", group: "JS Framework")
Pill.create!(skill: "NextJs", version: "Javascript V12.0", version_color: "#15BDFF", group: "JS Framework")
Pill.create!(skill: "NodeJs", version: "Javascript V16.16", version_color: "#15BDFF", group: "JS Framework")
Pill.create!(skill: "Express", version: "Javascript V4.0", version_color: "#15BDFF", group: "JS Framework")

Pill.create!(skill: "RoR", version: "Ruby V3 Rails V8", version_color: "#FF7A7A", group: "Ruby Framework")

Pill.create!(skill: "Prisma", version: "ORM V2.0", version_color: "#DA8AFF", group: "ORM")
Pill.create!(skill: "TypeORM", version: "ORM", version_color: "#DA8AFF", group: "ORM")

Pill.create!(skill: "Aws", version: "Cloud Services", version_color: "#FFB348", group: "Cloud Services")
Pill.create!(skill: "Azure", version: "Cloud Services", version_color: "#FFB348", group: "Cloud Services")

Pill.create!(skill: "Heroku", version: "Heroku-24", version_color: "#9EFFC5", group: "PaaS")
Pill.create!(skill: "Render", version: "Latest", version_color: "#9EFFC5", group: "PaaS")
Pill.create!(skill: "D.O.", version: "Digital Ocean", version_color: "#9EFFC5", group: "PaaS")

# Log Pills
p "Created #{Pill.count} Pills"

# Delete Projects
Project.destroy_all
p "#{Project.count} Projects left"

# Seed some projects
Project.create!(short_title: "Hermit Plus",
                short_description: "I love the Hermits of Hermitcraft. They are a colorful bunch that really push the ability of Minecraft. I think they need there own service. Enjoy.",
                title: "Hermit Plus",
                description: "Built early in my journey, this landing page was designed in Figma, built with React. That builds HTML, CSS, and JavaScript were set in a S3 bucket configured for a public web site, and ran through CloudFront for the Edge service. This is integrated into MILK-00.",
                #code_path: "https://github.com/Developer3027/hermit-plus-old",
                #design_path: "https://www.figma.com/design/1rA5nLglFEz6F1453wKwkG/Hermit-Plus?node-id=0-1&t=cqjJ5bHkDMbPFvxR-1",
                #live_path: "https://www.hermitplus.com/")
)
Project.create!(short_title: "Salt and Tar",
                short_description: "Love these guys and I decided to create the site I think they would enjoy. If you live there content like I do then like and subscribe.",
                title: "Salt and Tar",
                description: "I watch several sailing channels and would love to have then all in one place to enjoy. It would be even better is there was an online store for them where I can purchase the same products they use to build these beautiful vessels. Maybe be able to schedule a night cruise? Love you guys.",
                #design_path: "https://www.figma.com/design/dCAzFHKupofhmKft0Anl5L/Salt-and-Tar?node-id=0-1&t=Y3P3CbVwRbm5QAt4-1",
                #live_path: "This is integrated into MILK-00.")
)
Project.create!(short_title: "Copywriter",
                short_description: "Concept design integrated with a real world copywriter team. I love the design and modified it using there content. Example of what Rails can do.",
                title: "Copywriter",
                description: "Copywriter is an old Figma design that I found inspiration to dive back into. Site was designed and built in WordPress with Elementor. That work is lost. Found a copywriter team on Fiverr and am blending the two concepts. This project will have an internal email service at minimum.",
                #code_path: "https://github.com/Developer3027/copywriter",
                #design_path: "https://www.figma.com/design/BpH5fAxV5C06TYwTqBGxHB/Lisa-Benks?node-id=0-1&t=kFWGzNRfspBW7GWd-1")
)

Project.create!(short_title: "Zuke",
                short_description: "Simple audio player for listening to the music I love. This site has a really modern look and great functionality. Modeled roughly from the Zune player.",
                title: "Zuke",
                description: "I want a player in the cloud that is a lot like my old Zune player. A place where I can upload my mp3 and listen to them. I want a little functionality like a EQ and some extras like you may see on Sound Cloud or Spotify. I have to credit Indego Tech Tutorials for the start of this project because his concept was a solid foundation.",
                #code_path: "https://github.com/Developer3027/milk-rails8",
                #design_path: "This is integrated into MILK-00.")
)
# Log Projects
p "Created #{Project.count} Projects"

# Delete Categories
BlogCategory.destroy_all
p "#{BlogCategory.count} Categories left"

# Seed some categories
BlogCategory.create!(title: "General", description: "Sometimes there is no category for something. This is for that.")
BlogCategory.create!(title: "Heroku", description: "Common PaaS for hosting or serving Ruby on Rails applications.")
BlogCategory.create!(title: "AWS", description: "AWS is a cloud platform that provides a suite of AWS services to develop, deploy, and manage applications.")
BlogCategory.create!(title: "Git", description: "Git is a distributed version control system.")
BlogCategory.create!(title: "Rails", description: "Ruby on Rails is a server-side web application framework written in Ruby under the MIT License.")
BlogCategory.create!(title: "Ruby", description: "Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.")
BlogCategory.create!(title: "React", description: "React is a JavaScript library for building user interfaces.")
BlogCategory.create!(title: "NextJs", description: "Next.js gives you the best developer experience with all the features you need for production: hybrid static & server rendering, TypeScript support, smart caching, route optimization, and more.")
BlogCategory.create!(title: "Node", description: "Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.")
BlogCategory.create!(title: "JavaScript", description: "JavaScript is a lightweight, interpreted, or just-in-time compiled programming language with first-class functions.")
BlogCategory.create!(title: "Python", description: "Python is a high-level, interpreted, general-purpose programming language.")
BlogCategory.create!(title: "Base Web", description: "Base Web is a set of specifications for the World Wide Web, including HTML, CSS, and JavaScript.")

# Log Categories
p "Created #{BlogCategory.count} Categories"

# Delete Hermits
Hermit.destroy_all
p "#{Hermit.count} Hermits left"

# Path to the seed images
# image_path = Rails.root.join("db", "images")

# Seed some Hermits
# bdub_hermit = Hermit.create!(
#   first_name: "John",
#   last_name: "Booko",
#   alias: "bdouble100",
#   alias_image_alt: "B dubs info banner",
#   nick_name: "bdubs",
#   subs: "1.73",
#   quote: "Gotta Shweep",
#   info: "Bdouble0100, otherwise known as Bdouble0 or Bdubs, has been a hermit since 2013 when he joined up in season 5. Part of the B-Team, and NHO, Bdubs had a great season. He really took to the jungle and built an amazing tree with a massive glass dome. His builds  are just as impressive as the mayhem he brings. An amazing builder who is always up for anything. He has an obession with sleeping at dusk and always knows the time.",
#   youtube: "https://youtube.com/bdoubleo",
#   twitch: "https://www.twitch.tv/BdoubleO100",
#   instagram: "https://www.instagram.com/bdoubleoinsta/",
#   patreon: "https://www.patreon.com/BdoubleO100",
#   skin_alt: "B dubs minecraft skin",
#   face_alt: "That big eye, anime face we love",
#   avatar_path:
#     "https://yt3.ggpht.com/ytc/AKedOLQS_kfkNT9Sq16v8aFJhEDE65vjCYNy9s0DjT5zGg=s88-c-k-c0x00ffffff-no-rj",
#   banner_path:
#     "https://yt3.ggpht.com/R53VE4obsKPmDY_xPTfIKyeh3Z7IezoNQ2SNqTlVc6lbFXA12j3CLxIySPTh4WHgX_r-qJwU=w1060-fcrop64=1,00005a57ffffa5a8-k-c0xffffffff-no-nd-rj"
# )

# Attach images
# bdub_hermit.alias_image.attach(io: File.open(image_path.join("bdubsInfoBannerText.png")), filename: "bdubsInfoBannerText.png", content_type: "image/png")
# bdub_hermit.skin_image.attach(io: File.open(image_path.join("bdouble_minecraft_skin.png")), filename: "bdouble_minecraft_skin.png", content_type: "image/png")
# bdub_hermit.face_image.attach(io: File.open(image_path.join("bdouble-face.png")), filename: "bdouble-face.png", content_type: "image/png")

# Video for specific hermit
# HermitVideo.create!(
#   hermit: bdub_hermit,
#   thumbnail_path: "https://i.ytimg.com/vi/JK7tfMkMYmQ/maxresdefault.jpg",
#   youtube_video_id: "JK7tfMkMymQ",
#   title: "Bdouble O, Season 8, Episode 1",
#   season: 8,
#   episode: 1
# )

# Save the record with attachments
# bdub_hermit.save!

# Log Hermits
# p "Created #{Hermit.count} Hermits"

# Clear existing data (order matters due to FK constraints)
[ SongGenre, Song, Album, Artist, Genre ].each(&:destroy_all)

# Helper methods
def attach_and_wait(record, field_name, file_path, content_type_prefix)
  return unless File.exist?(file_path)

  record.send(field_name).attach(
    io: File.open(file_path),
    filename: File.basename(file_path),
    content_type: "#{content_type_prefix}/#{File.extname(file_path).delete('.')}"
  )

  # Explicitly save to trigger attachment processing
  record.save!

  # Wait for the attachment to process
  if record.send(field_name).attached?
    record.send(field_name).blob.reload
  end
end

def set_urls_for_record(record)
  case record
  when Artist
    if record.image.attached?
      blob = record.image.blob
      s3_url = "https://milk-blog.s3.us-east-2.amazonaws.com/#{blob.key}"
      record.update_column(:image_url, s3_url)
    end

  when Album
    if record.cover_art.attached?
      blob = record.cover_art.blob
      s3_url = "https://milk-blog.s3.us-east-2.amazonaws.com/#{blob.key}"
      record.update_column(:cover_art_url, s3_url)
    end

  when Song
    if record.image.attached?
      blob = record.image.blob
      s3_url = "https://milk-blog.s3.us-east-2.amazonaws.com/#{blob.key}"
      record.update_column(:song_image_url, s3_url)
    end

    if record.audio_file.attached?
      blob = record.audio_file.blob
      s3_url = "https://milk-blog.s3.us-east-2.amazonaws.com/#{blob.key}"
      record.update_column(:song_file_url, s3_url)
    end
  end
end

# Path to the seed files
base_path = Rails.root.join("db", "music_files")

# Define your artists data
artists_data = [
  {
    name: "Chris Rea",
    image_path: "chris_rea/chris_rea-artist.jpeg",
    albums: [
      {
        title: "Josephine",
        release_year: 1985,
        genre_name: "Blues-Rock",
        cover_art_path: "chris_rea/josephine-s-m.jpg",
        songs: [
          {
            title: "Josephine",
            song_image_path: "chris_rea/josephine.jpeg",
            song_file_path: "chris_rea/josephine.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "David Lee Roth",
    image_path: "david_lee_roth/david_lee_roth-artist.jpeg",
    albums: [
      {
        title: "Skyscraper",
        release_year: 1988,
        genre_name: "Hard Rock",
        cover_art_path: "david_lee_roth/Skyscraper_(David_Lee_Roth_album_-_cover_art).jpg",
        songs: [
          {
            title: "Hina",
            song_image_path: "david_lee_roth/hina.jpeg",
            song_file_path: "david_lee_roth/Hina.mp3"
          },
          {
            title: "Skyscraper",
            song_image_path: "david_lee_roth/skyscraper.jpeg",
            song_file_path: "david_lee_roth/Skyscraper.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Dream on Dreamer",
    image_path: "dream_on_dreamer/dream_on_dreamer-artist.jpeg",
    albums: [
      {
        title: "It Comes and Goes",
        release_year: 2018,
        genre_name: "Rock",
        cover_art_path: "dream_on_dreamer/runaway.jpeg",
        songs: [
          {
            title: "Runaway",
            song_image_path: "dream_on_dreamer/runaway.jpeg",
            song_file_path: "dream_on_dreamer/runaway.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Aoshi",
    image_path: "flutter/fluttershy.png",
    albums: [
      {
        title: "Flutter",
        release_year: 2016,
        genre_name: "Electronic",
        cover_art_path: "flutter/flutter.jpg",
        songs: [
          {
            title: "Flutter",
            song_image_path: "flutter/flutter.jpg",
            song_file_path: "flutter/flutter.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Heavy Metal",
    image_path: "heavy_metal/heavy_metal-artist.jpeg",
    albums: [
      {
        title: "Heavy Metal",
        release_year: 2016,
        genre_name: "Rock",
        cover_art_path: "heavy_metal/heavy-metal.jpg",
        songs: [
          {
            title: "Blue Lamp",
            song_image_path: "heavy_metal/heavy-metal.jpg",
            song_file_path: "heavy_metal/blue-lamp.mp3"
          },
          {
            title: "All-Of-You",
            song_image_path: "heavy_metal/heavy-metal.jpg",
            song_file_path: "heavy_metal/All-Of-You.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Kaskade",
    image_path: "kaskade/kaskade-artist.jpeg",
    albums: [
      {
        title: "Strobelite Seduction",
        release_year: 2008,
        genre_name: "Electronic",
        cover_art_path: "kaskade/kaskade.jpg",
        songs: [
          {
            title: "Move for Me",
            song_image_path: "kaskade/kaskade.jpg",
            song_file_path: "kaskade/move for me.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Korn",
    image_path: "Korn/korn-artist.jpeg",
    albums: [
      {
        title: "The Paradigm Shift",
        release_year: 2014,
        genre_name: "Rock",
        cover_art_path: "Korn/paradigm-shift.jpg",
        songs: [
          {
            title: "Spike in My Veins",
            song_image_path: "Korn/spike in my veins.jpeg",
            song_file_path: "Korn/Spike in My Veins.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "The Smiths",
    image_path: "KWM_Music/kwm-artist.jpeg",
    albums: [
      {
        title: "Hatful of Hollow",
        release_year: 1984,
        genre_name: "Rock",
        cover_art_path: "KWM_Music/how soon is now.jpeg",
        songs: [
          {
            title: "How Soon is Now",
            song_image_path: "KWM_Music/how soon is now.jpeg",
            song_file_path: "KWM_Music/How Soon is Now.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Motley_Crue",
    image_path: "motley_crue/dr_feelgood-artist.jpeg",
    albums: [
      {
        title: "Dr. Feelgood",
        release_year: 1989,
        genre_name: "Heavy Metal",
        cover_art_path: "motley_crue/Motley_Crue_-_Dr_Feelgood-front.jpg",
        songs: [
          {
            title: "Dr. Feelgood",
            song_image_path: "motley_crue/Motley_Crue_-_Dr_Feelgood-front.jpg",
            song_file_path: "motley_crue/dr-feelgood.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "Sakoya",
    image_path: "sakoya/sakoya-artist.jpeg",
    albums: [
      {
        title: "Wandering",
        release_year: 2023,
        genre_name: "Rock",
        cover_art_path: "sakoya/wandering.jpeg",
        songs: [
          {
            title: "Wandering",
            song_image_path: "sakoya/wandering.jpeg",
            song_file_path: "sakoya/wandering.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "crazy town",
    image_path: "crazy_town/crazy-town-artist.jpeg",
    albums: [
      {
        title: "the brimstone sluggers",
        release_year: 2015,
        genre_name: "Metal",
        cover_art_path: "crazy_town/the-brimstone-sluggers.png",
        songs: [
          {
            title: "back pack",
            song_image_path: "crazy_town/the-brimstone-sluggers.png",
            song_file_path: "crazy_town/backpack.mp3"
          },
          {
            title: "come inside",
            song_image_path: "crazy_town/the-brimstone-sluggers.png",
            song_file_path: "crazy_town/come-inside.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "rootkit",
    image_path: "rootkit/rootkit-artist.jpeg",
    albums: [
      {
        title: "do it",
        release_year: 2014,
        genre_name: "Electronic",
        cover_art_path: "rootkit/do-it.png",
        songs: [
          {
            title: "do it",
            song_image_path: "rootkit/do-it.png",
            song_file_path: "rootkit/do it.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "TSS",
    image_path: "tss/tss-artist.jpeg",
    albums: [
      {
        title: "killing me",
        release_year: 2024,
        genre_name: "Metal",
        cover_art_path: "tss/killing-me.jpeg",
        songs: [
          {
            title: "fantasize",
            song_image_path: "tss/killing-me.jpeg",
            song_file_path: "tss/fantasize.mp3"
          },
          {
            title: "killing me",
            song_image_path: "tss/killing-me.jpeg",
            song_file_path: "tss/killing me.mp3"
          }
        ]
      }
    ]
  },
  {
    name: "dark new day",
    image_path: "dark-new-day/twelve years of silence.png",
    albums: [
      {
        title: "twelve years of silence",
        release_year: 2005,
        genre_name: "Rock",
        cover_art_path: "dark-new-day/twelve years of silence.png",
        songs: [
          {
            title: "brother",
            song_image_path: "dark-new-day/twelve years of silence.png",
            song_file_path: "dark-new-day/brother.mp3"
          }
        ]
      }
    ]
  }
]

# Process artists data
artists_data.each do |artist_data|
  # Create Artist
  artist = Artist.find_or_create_by!(name: artist_data[:name])
  if artist_data[:image_path]
    attach_and_wait(artist, :image, base_path.join(artist_data[:image_path]), "image")
  end

  artist_data[:albums].each do |album_data|
    # Create Genre
    genre = Genre.find_or_create_by!(name: album_data[:genre_name])

    # Create Album
    album = Album.find_or_create_by!(
      title: album_data[:title],
      release_year: album_data[:release_year],
      artist: artist,
      genre: genre
    )

    if album_data[:cover_art_path]
      attach_and_wait(album, :cover_art, base_path.join(album_data[:cover_art_path]), "image")
    end

    album_data[:songs].each do |song_data|
      # Create Song
      song = Song.find_or_create_by!(
        title: song_data[:title],
        artist: artist,
        album: album
      )

      # Attach song image and audio
      if song_data[:song_image_path]
        attach_and_wait(song, :image, base_path.join(song_data[:song_image_path]), "image")
      end

      if song_data[:song_file_path]
        attach_and_wait(song, :audio_file, base_path.join(song_data[:song_file_path]), "audio")
      end

      # Create SongGenre
      SongGenre.find_or_create_by!(song: song, genre: genre)
    end
  end
end

# Now that all records are created and attachments are processed, set URLs
[Artist, Album, Song].each do |model|
  model.find_each do |record|
    set_urls_for_record(record)
  end
end

puts "Seeding completed successfully!"

# Path to the seed files
# image_path = Rails.root.join("db", "music_files")

# 1. Create Artist
# chris_rea = Artist.find_or_create_by!(name: "Chris Rea")
# chris_rea.image.attach(
#   io: File.open(image_path.join("chris_rea/chris_rea-artist.jpeg")),
#   filename: "chris_rea-artist.jpeg",
#   content_type: "image/jpeg"
# )

# 2. Create Genre
# chris_rea_genre = Genre.find_or_create_by!(name: "Blues-Rock")

# 3. Create Album
# chris_rea_album = Album.find_or_create_by!(
#   title: "Josephine",
#   release_year: 1985,
#   artist: chris_rea,
#   genre: chris_rea_genre
# )
# chris_rea_album.cover_art.attach(
#   io: File.open(image_path.join("chris_rea/josephine-s-m.jpg")),
#   filename: "josephine-s-m.jpg",
#   content_type: "image/jpg"
# )

# 4. Create Song (WITH artist and album)
# chris_rea_song = Song.find_or_create_by!(
#   title: "Josephine",
#   artist: chris_rea,       # Ensures artist exists
#   album: chris_rea_album   # Optional (if songs belong_to albums)
# )
# chris_rea_song.image.attach(
#   io: File.open(image_path.join("chris_rea/josephine.jpeg")),
#   filename: "josephine.jpeg",
#   content_type: "image/jpeg"
# )
# chris_rea_song.audio_file.attach(
#   io: File.open(image_path.join("chris_rea/josephine.mp3")),
#   filename: "josephine.mp3",
#   content_type: "audio/mpeg"
# )

# 5. Create SongGenre
# SongGenre.find_or_create_by!(song: chris_rea_song, genre: chris_rea_genre)

# Seed Artists, Albums, and Songs
# artists_data = [
#   {
#     name: "Chris Rea",
#     image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/hr8rxl8zu3jt2o14roe584yr8wsu",
#     albums: [
#       {
#         title: "Josephine",
#         release_year: 1985,
#         genre_name: "Blues Rock",
#         cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/ul0nd9ux92safygc9ko8zjsj1cte",
#         songs: [
#           {
#             title: "Josephine",
#             song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/9droyukrftlqntqcg78lwugzcikg",
#             song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/4e5ce44i31jg4upft0bk9scq7041"
#           }
#         ]
#       }
#     ]
#   }
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
  #   name: "Heavy Metal",
  #   image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/a8d3na2ck8ao25xbt1jfx0bxr8qa",
  #   albums: [
  #     {
  #       title: "Heavy Metal",
  #       release_year: 2016,
  #       genre_name: "Rock",
  #       cover_art_url: "https://milk-blog.s3.us-east-2.amazonaws.com/hhlnkt4rcmk2w36xe9nfp7z05dqk",
  #       songs: [
  #         {
  #           title: "Blue Lamp",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/njwo4meuarhaoun0tg29vlgveetf",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/41spw5lzx1s1t34yf1ovpdqkqyag"
  #         },
  #         {
  #           title: "All-Of-You",
  #           song_image_url: "https://milk-blog.s3.us-east-2.amazonaws.com/qan4gq6qwmay9jmlsvdwaigc379z",
  #           song_file_url: "https://milk-blog.s3.us-east-2.amazonaws.com/y8w4cbxk1u7vxhlni9or0al6i32v"
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
  # },
  # {
  #   name: "The Smiths",
  #   image_path: "music_files/KWM_Music/kwm-artist.jpeg",
  #   albums: [
  #     {
  #       title: "Hatful of Hollow",
  #       release_year: 1984,
  #       genre_name: "Rock",
  #       cover_art_path: "music_files/KWM_Music/how soon is now.jpeg",
  #       songs: [
  #         {
  #           title: "How Soon is Now",
  #           song_image_path: "music_files/KWM_Music/how soon is now.jpeg",
  #           song_file_path: "music_files/KWM_Music/How Soon is Now.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Motley_Crue",
  #   image_path: "music_files/motley_crue/dr_feelgood-artist.jpeg",
  #   albums: [
  #     {
  #       title: "Dr. Feelgood",
  #       release_year: 1989,
  #       genre_name: "Heavy Metal",
  #       cover_art_path: "music_files/motley_crue/Motley_Crue_-_Dr_Feelgood-front.jpg",
  #       songs: [
  #         {
  #           title: "Dr. Feelgood",
  #           song_image_path: "music_files/motley_crue/Motley_Crue_-_Dr_Feelgood-front.jpg",
  #           song_file_path: "music_files/motley_crue/dr-feelgood.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "Sakoya",
  #   image_path: "music_files/sakoya/sakoya-artist.jpeg",
  #   albums: [
  #     {
  #       title: "Wandering",
  #       release_year: 2023,
  #       genre_name: "Rock",
  #       cover_art_path: "music_files/sakoya/wandering.jpeg",
  #       songs: [
  #         {
  #           title: "Wandering",
  #           song_image_path: "music_files/sakoya/wandering.jpeg",
  #           song_file_path: "music_files/sakoya/wandering.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "crazy town",
  #   image_path: "music_files/crazy_town/crazy-town-artist.jpeg",
  #   albums: [
  #     {
  #       title: "the brimstone sluggers",
  #       release_year: 2015,
  #       genre_name: "Metal",
  #       cover_art_path: "music_files/crazy_town/the-brimstone-sluggers.png",
  #       songs: [
  #         {
  #           title: "back pack",
  #           song_image_path: "music_files/crazy_town/the-brimstone-sluggers.png",
  #           song_file_path: "music_files/crazy_town/backpack.mp3"
  #         },
  #         {
  #           title: "come inside",
  #           song_image_path: "music_files/crazy_town/the-brimstone-sluggers.png",
  #           song_file_path: "music_files/crazy_town/come_inside.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "rootkit",
  #   image_path: "music_files/rootkit/rootkit-artist.jpeg",
  #   albums: [
  #     {
  #       title: "do it",
  #       release_year: 2014,
  #       genre_name: "Electronic",
  #       cover_art_path: "music_files/rootkit/do-it.png",
  #       songs: [
  #         {
  #           title: "back pack",
  #           song_image_path: "music_files/rootkit/do-it.png",
  #           song_file_path: "music_files/rootkit/do it.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "TSS",
  #   image_path: "music_files/tss/tss-artist.jpeg",
  #   albums: [
  #     {
  #       title: "killing me",
  #       release_year: 2024,
  #       genre_name: "Metal",
  #       cover_art_path: "music_files/tss/killing-me.jpeg",
  #       songs: [
  #         {
  #           title: "fantasize",
  #           song_image_path: "music_files/tss/killing-me.jpeg",
  #           song_file_path: "music_files/tss/fantasize.mp3"
  #         },
  #         {
  #           title: "killing me",
  #           song_image_path: "music_files/tss/killing-me.jpeg",
  #           song_file_path: "music_files/tss/killing me.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # },
  # {
  #   name: "dark new day",
  #   image_path: "music_files/dark-new-day/twelve years of silence.png",
  #   albums: [
  #     {
  #       title: "twelve years of silence",
  #       release_year: 2005,
  #       genre_name: "Rock",
  #       cover_art_path: "music_files/dark-new-day/twelve years of silence.png",
  #       songs: [
  #         {
  #           title: "brother",
  #           song_image_path: "music_files/dark-new-day/twelve years of silence.png",
  #           song_file_path: "music_files/dark-new-day/brother.mp3"
  #         }
  #       ]
  #     }
  #   ]
  # }
  # ]

# Seed data with error handling
# artists_data.each do |artist_data|
#   begin
#     artist = Artist.create!(name: artist_data[:name])
#     attach_file(artist, :image, artist_data[:image_path])

#     artist_data[:albums].each do |album_data|
#       genre = Genre.find_or_create_by!(name: album_data[:genre_name])

#       album = artist.albums.create!(
#         title: album_data[:title],
#         release_year: album_data[:release_year],
#         genre: genre
#       )
#       attach_file(album, :cover_art, album_data[:cover_art_path])

#       album_data[:songs].each do |song_data|
#         song = album.songs.create!(
#           title: song_data[:title],
#           artist: artist
#         )
#         attach_file(song, :image, song_data[:song_image_path])
#         attach_file(song, :audio_file, song_data[:song_file_path])
#         SongGenre.create!(song: song, genre: genre)
#       end
#     end
#   rescue => e
#     puts "⚠️ ERROR in artist #{artist_data[:name]}: #{e.message}"
#   end
# end


puts "Seeded #{Artist.count} artists, #{Album.count} albums, #{Song.count} songs."
