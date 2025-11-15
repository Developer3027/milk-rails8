class AddAttributionToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :image_credit, :string
    add_column :songs, :image_credit_url, :string
    add_column :songs, :image_license, :string
    add_column :songs, :audio_source, :string
    add_column :songs, :audio_license, :string
    add_column :songs, :additional_credits, :text
  end
end
