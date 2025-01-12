class AddColumnToBlog < ActiveRecord::Migration[8.0]
  def change
    add_column :blogs, :image_url, :string
  end
end
