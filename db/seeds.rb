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
                code_url: "https://github.com/Developer3027/hermit-plus-old",
                design_url: "https://www.figma.com/design/1rA5nLglFEz6F1453wKwkG/Hermit-Plus?node-id=0-1&t=cqjJ5bHkDMbPFvxR-1",
                live_url: "https://www.hermitplus.com/")

Project.create!(short_title: "Salt and Tar",
                short_description: "Love these guys and I decided to create the site I think they would enjoy. If you live there content like I do then like and subscribe.",
                title: "Salt and Tar",
                description: "I watch several sailing channels and would love to have then all in one place to enjoy. It would be even better is there was an online store for them where I can purchase the same products they use to build these beautiful vessels. Maybe be able to schedule a night cruise? Love you guys.",
                design_url: "https://www.figma.com/design/dCAzFHKupofhmKft0Anl5L/Salt-and-Tar?node-id=0-1&t=Y3P3CbVwRbm5QAt4-1",
                live_url: "This is integrated into MILK-00.")

Project.create!(short_title: "Copywriter",
                short_description: "Concept design integrated with a real world copywriter team. I love the design and modified it using there content. Example of what Rails can do.",
                title: "Copywriter",
                description: "Copywriter is an old Figma design that I found inspiration to dive back into. Site was designed and built in WordPress with Elementor. That work is lost. Found a copywriter team on Fiverr and am blending the two concepts. This project will have an internal email service at minimum.",
                code_url: "https://github.com/Developer3027/copywriter",
                design_url: "https://www.figma.com/design/BpH5fAxV5C06TYwTqBGxHB/Lisa-Benks?node-id=0-1&t=kFWGzNRfspBW7GWd-1")

Project.create!(short_title: "Zuke",
                short_description: "Simple audio player for listening to the music I love. This site has a really modern look and great functionality. Modeled roughly from the Zune player.",
                title: "Zuke",
                description: "I want a player in the cloud that is a lot like my old Zune player. A place where I can upload my mp3 and listen to them. I want a little functionality like a EQ and some extras like you may see on Sound Cloud or Spotify. I have to credit Indego Tech Tutorials for the start of this project because his concept was a solid foundation.",
                code_url: "https://github.com/Developer3027/milk-rails8",
                design_url: "This is integrated into MILK-00.")

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
#   avatar_url:
#     "https://yt3.ggpht.com/ytc/AKedOLQS_kfkNT9Sq16v8aFJhEDE65vjCYNy9s0DjT5zGg=s88-c-k-c0x00ffffff-no-rj",
#   banner_url:
#     "https://yt3.ggpht.com/R53VE4obsKPmDY_xPTfIKyeh3Z7IezoNQ2SNqTlVc6lbFXA12j3CLxIySPTh4WHgX_r-qJwU=w1060-fcrop64=1,00005a57ffffa5a8-k-c0xffffffff-no-nd-rj"
# )

# Attach images
# bdub_hermit.alias_image.attach(io: File.open(image_path.join("bdubsInfoBannerText.png")), filename: "bdubsInfoBannerText.png", content_type: "image/png")
# bdub_hermit.skin_image.attach(io: File.open(image_path.join("bdouble_minecraft_skin.png")), filename: "bdouble_minecraft_skin.png", content_type: "image/png")
# bdub_hermit.face_image.attach(io: File.open(image_path.join("bdouble-face.png")), filename: "bdouble-face.png", content_type: "image/png")

# Video for specific hermit
# HermitVideo.create!(
#   hermit: bdub_hermit,
#   thumbnail_url: "https://i.ytimg.com/vi/JK7tfMkMYmQ/maxresdefault.jpg",
#   youtube_video_id: "JK7tfMkMymQ",
#   title: "Bdouble O, Season 8, Episode 1",
#   season: 8,
#   episode: 1
# )

# Save the record with attachments
# bdub_hermit.save!

# Log Hermits
# p "Created #{Hermit.count} Hermits"
