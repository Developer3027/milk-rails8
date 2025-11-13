class CreateMilkAdminProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :milk_admin_profiles do |t|
      t.references :milk_admin, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.json :social_links

      t.timestamps
    end
  end
end
