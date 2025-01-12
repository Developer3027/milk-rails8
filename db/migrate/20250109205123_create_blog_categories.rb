class CreateBlogCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
