# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destroy Milk Admin
MilkAdmin.destroy_all
p "#{MilkAdmin.count} MilkAdmins left"

# Log Milk Admin
MilkAdmin.create!(email: "milk_admin@localhost", password: "password", password_confirmation: "password")
p "Created MilkAdmin"

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
