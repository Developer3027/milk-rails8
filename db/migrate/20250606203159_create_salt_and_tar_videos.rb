class CreateSaltAndTarVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :salt_and_tar_videos do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.string :thumbnail_url
      t.integer :position
      t.boolean :published, default: false

      t.timestamps
    end
    add_index :salt_and_tar_videos, :published
  end
end
