class Blog < ApplicationRecord
  belongs_to :milk_admin
  belongs_to :blog_category

  # before update or create run process_body
  before_save :process_body

  has_rich_text :toc
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

  def self.ransackable_attributes(auth_object = nil)
    # List of attributes you want to allow searching on
    %w[title subtitle published_at blog_category_id created_at updated_at]
  end

  # Process the body content of a blog post by extracting the HTML content
  # from the rich text body, generating a table of contents from any headings,
  # and modifying the body content by adding ids to the headings so that they
  # can be linked to from the table of contents.
  # This process_body method is handled by the TocGenerator service.
  def process_body
    # Extract the HTML content from the rich text body
    body_content = content.to_s

    # Use the service to generate TOC and modify body content
    result = TocGenerator.new(body_content).generate

    self.toc = result[:toc]  # Update the TOC
    self.processed_body = result[:body]  # Update the :content with modified body
  end

  # def processed_body_html
  #   sanitize(processed_body, tags: %w[h1 h2 p a ul ol li strong em br img span div], attributes: %w[href src id class style])
  # end
end
