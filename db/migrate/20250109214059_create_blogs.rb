class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.datetime :published_at
      t.references :milk_admin, null: false, foreign_key: true
      t.references :blog_categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
