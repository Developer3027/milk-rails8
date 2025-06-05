class Project < ApplicationRecord
  has_many :resume_projects
  has_many :resumes, through: :resume_projects

  has_rich_text :description
  has_one_attached :project_image, dependent: :destroy

  validate :validate_url_fields

  ALLOWED_DOMAINS = [ "github.com", "gitlab.com", "figma.com", "https://milk-00-aa48920a95b8.herokuapp.com/" ]

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
