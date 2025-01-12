class Blog < ApplicationRecord
  belongs_to :milk_admin
  belongs_to :blog_category

  has_rich_text :content

  has_one_attached :blog_image, dependent: :destroy

  # validates that these attributes are present
  validates :title, presence: true
  validates :content, presence: true
  validates :blog_category_id, presence: true

  # set up scopes for sorted, scheduled, published, and draft
  scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }


  # Is the blog post a draft?
  #
  # A blog post is a draft if it doesn't have a published_at date.
  def draft?
    published_at.nil?
  end

  # Is the blog post published?
  #
  # A blog post is published if it has a published_at date and
  # that date is in the past.
  def published?
    published_at? && published_at <= Time.current
  end

  # Is the blog post scheduled?
  #
  # A blog post is scheduled if it has a published_at date and
  # that date is in the future.
  def scheduled?
    published_at? && published_at > Time.current
  end
end
