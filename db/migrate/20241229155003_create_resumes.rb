class CreateResumes < ActiveRecord::Migration[8.0]
  def change
    create_table :resumes do |t|
      t.string :title
      t.string :full_name
      t.string :addr
      t.string :citystatezip
      t.string :email
      t.string :linkedin
      t.string :code_1
      t.string :code_2

      t.timestamps
    end
  end
end
