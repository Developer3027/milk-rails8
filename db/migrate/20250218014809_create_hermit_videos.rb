class CreateHermitVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :hermit_videos do |t|
      t.string :youtube_video_id
      t.string :thumbnail_url
      t.string :title
      t.integer :season
      t.integer :episode
      t.references :hermit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
