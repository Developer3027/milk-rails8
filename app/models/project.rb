class Project < ApplicationRecord
  has_many :resume_projects
  has_many :resumes, through: :resume_projects

  has_rich_text :description
  has_one_attached :project_image, dependent: :destroy
end
