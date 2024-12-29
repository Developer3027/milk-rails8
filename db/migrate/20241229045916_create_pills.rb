class CreatePills < ActiveRecord::Migration[8.0]
  def change
    create_table :pills do |t|
      t.string :skill
      t.string :version
      t.string :version_color

      t.timestamps
    end
  end
end
