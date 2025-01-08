class Resume < ApplicationRecord
  has_many :resume_projects
  has_many :projects, through: :resume_projects
  has_many :resume_pills
  has_many :pills, through: :resume_pills
end
