class Project < ApplicationRecord
  has_many :resume_projects
  has_many :resumes, through: :resume_projects

  has_many :tasks, dependent: :destroy

  has_rich_text :description
  has_one_attached :project_image, dependent: :destroy

  validate :validate_url_fields

  ALLOWED_DOMAINS = [ "github.com", "gitlab.com", "figma.com", "herokuapp.com" ]

  def progress_percentage
    return 0 if tasks.empty?

    completed_tasks = tasks.where(completed: true)
    (completed_tasks.count.to_f / tasks.count) * 100
  end

  def progress_percentage_by_time
    total_time = tasks.sum(:estimated_time)
    return 0 if total_time == 0

    completed_time = tasks.where(completed: true).sum(:estimated_time)
    (completed_time.to_f / total_time) * 100
  end

  private

  def validate_url_fields
    validate_url(:code_url)
    validate_url(:design_url)
    validate_url(:live_url)
  end

  def validate_url(field)
    url = send(field)
    return if url.blank?

    uri = URI.parse(url)

    unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
      errors.add(field, "must be a valid HTTP/HTTPS URL")
      return
    end

    unless ALLOWED_DOMAINS.include?(uri.host)
      errors.add(field, "must point to an approved domain (#{ALLOWED_DOMAINS.join(', ')})")
    end
  rescue URI::InvalidURIError
    errors.add(field, "is not a valid URL")
  end
end
