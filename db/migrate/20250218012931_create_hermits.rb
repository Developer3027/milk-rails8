class CreateHermits < ActiveRecord::Migration[8.0]
  def change
    create_table :hermits do |t|
      t.string :first_name
      t.string :last_name
      t.string :alias
      t.string :alias_image_alt
      t.string :nick_name
      t.float :subs
      t.string :quote
      t.string :youtube
      t.string :twitch
      t.string :twitter
      t.string :instagram
      t.string :patreon
      t.string :skin_alt
      t.string :face_alt
      t.string :avatar_url
      t.string :banner_url

      t.timestamps
    end
  end
end
