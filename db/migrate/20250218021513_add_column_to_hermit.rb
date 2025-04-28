class AddColumnToHermit < ActiveRecord::Migration[8.0]
  def change
    add_column :hermits, :alias_image_url, :string
  end
end
