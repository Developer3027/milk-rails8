class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :code_url
      t.string :design_url
      t.string :live_url
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
