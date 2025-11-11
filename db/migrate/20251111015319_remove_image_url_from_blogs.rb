class RemoveImageUrlFromBlogs < ActiveRecord::Migration[8.0]
  def change
    remove_column :blogs, :image_url, :string
  end
end
