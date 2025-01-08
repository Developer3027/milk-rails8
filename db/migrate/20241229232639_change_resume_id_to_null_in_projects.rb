class ChangeResumeIdToNullInProjects < ActiveRecord::Migration[8.0]
  def change
    change_column_null :projects, :resume_id, true
  end
end
