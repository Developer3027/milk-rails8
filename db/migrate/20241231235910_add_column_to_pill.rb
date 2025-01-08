class AddColumnToPill < ActiveRecord::Migration[8.0]
  def change
    add_column :pills, :group, :string
  end
end
