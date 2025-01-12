class RenameBlogCategoriesIdToBlogCategoryIdInBlogs < ActiveRecord::Migration[8.0]
  def change
    rename_column :blogs, :blog_categories_id, :blog_category_id
  end
end
