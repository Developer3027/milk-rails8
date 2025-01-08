# frozen_string_literal: true

class PillComponent < ViewComponent::Base
  def initialize(skill:, version:, version_color:)
    @skill = skill
    @version = version
    @version_color = version_color
  end
end
