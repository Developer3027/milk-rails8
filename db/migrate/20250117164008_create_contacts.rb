class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
