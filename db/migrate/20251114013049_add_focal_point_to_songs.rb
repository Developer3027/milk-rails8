class AddFocalPointToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :focal_point_x, :float, default: 0.5
    add_column :songs, :focal_point_y, :float, default: 0.5
  end
end
