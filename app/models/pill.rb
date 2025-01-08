class Pill < ApplicationRecord
  has_many :resume_pills
  has_many :resumes, through: :resume_pills
end
