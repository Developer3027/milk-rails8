class AddColumnsToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :short_title, :string
    add_column :projects, :short_description, :text
  end
end
