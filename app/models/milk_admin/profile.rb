class MilkAdmin::Profile < ApplicationRecord
  belongs_to :milk_admin

  has_one_attached :avatar, dependent: :destroy

  # Validations
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :bio, length: { maximum: 1000 }

  # Return full name
  def full_name
    "#{first_name} #{last_name}".strip
  end

  # Return social link by name
  def social_link(name)
    social_links&.dig(name.to_s)
  end
end
