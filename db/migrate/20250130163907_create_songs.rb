class CreateSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :album
      t.string :title

      t.timestamps
    end
  end
end
