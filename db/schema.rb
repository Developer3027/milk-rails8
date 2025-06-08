# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_08_165020) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
    t.string "cover_art_url"
    t.bigint "genre_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["genre_id"], name: "index_albums_on_genre_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.datetime "published_at"
    t.bigint "milk_admin_id", null: false
    t.bigint "blog_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.text "processed_body"
    t.string "slug"
    t.index ["blog_category_id"], name: "index_blogs_on_blog_category_id"
    t.index ["milk_admin_id"], name: "index_blogs_on_milk_admin_id"
    t.index ["slug"], name: "index_blogs_on_slug", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hermit_videos", force: :cascade do |t|
    t.string "youtube_video_id"
    t.string "thumbnail_url"
    t.string "title"
    t.integer "season"
    t.integer "episode"
    t.bigint "hermit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hermit_id"], name: "index_hermit_videos_on_hermit_id"
  end

  create_table "hermits", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "alias"
    t.string "alias_image_alt"
    t.string "nick_name"
    t.float "subs"
    t.string "quote"
    t.string "youtube"
    t.string "twitch"
    t.string "twitter"
    t.string "instagram"
    t.string "patreon"
    t.string "skin_alt"
    t.string "face_alt"
    t.string "avatar_url"
    t.string "banner_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "alias_image_url"
  end

  create_table "milk_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_milk_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_milk_admins_on_reset_password_token", unique: true
  end

  create_table "pills", force: :cascade do |t|
    t.string "skill"
    t.string "version"
    t.string "version_color"
    t.bigint "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.index ["resume_id"], name: "index_pills_on_resume_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "code_url"
    t.string "design_url"
    t.string "live_url"
    t.bigint "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_title"
    t.text "short_description"
    t.index ["resume_id"], name: "index_projects_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "title"
    t.string "full_name"
    t.string "addr"
    t.string "citystatezip"
    t.string "email"
    t.string "linkedin"
    t.string "code_1"
    t.string "code_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salt_and_tar_videos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "video_url"
    t.string "thumbnail_url"
    t.integer "position"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "youtube_url"
    t.index ["published"], name: "index_salt_and_tar_videos_on_published"
  end

  create_table "song_genres", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "genre_id", null: false
    t.index ["genre_id"], name: "index_song_genres_on_genre_id"
    t.index ["song_id"], name: "index_song_genres_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "song_image_url"
    t.string "song_file_url"
    t.bigint "artist_id", null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "genres"
  add_foreign_key "blogs", "blog_categories"
  add_foreign_key "blogs", "milk_admins"
  add_foreign_key "hermit_videos", "hermits"
  add_foreign_key "pills", "resumes"
  add_foreign_key "projects", "resumes"
  add_foreign_key "song_genres", "genres"
  add_foreign_key "song_genres", "songs"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "artists"
end
