class AddFeaturedToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :featured, :boolean, default: false, null: false
    add_index :blogs, :featured, unique: true, where: "featured IS TRUE"
  end
end
