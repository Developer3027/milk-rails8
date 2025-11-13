class MilkAdmin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :blogs
  has_one :profile, class_name: "MilkAdmin::Profile", dependent: :destroy

  # Delegate profile methods for convenience
  delegate :first_name, :last_name, :bio, :social_links, :full_name, to: :profile, allow_nil: true

  # Ensure profile is created after admin is created
  after_create :create_default_profile

  private

  def create_default_profile
    create_profile unless profile
  end
end
