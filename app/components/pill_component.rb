# frozen_string_literal: true

class PillComponent < ViewComponent::Base
  def initialize(skill:, version_color:, version:)
    @skill = skill
    @version_color = version_color
    @version = version
  end
end
