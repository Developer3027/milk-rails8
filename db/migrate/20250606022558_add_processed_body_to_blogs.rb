class AddProcessedBodyToBlogs < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :processed_body, :text
  end
end
