
class SkillsController < ApplicationController
  # GET /skills/index (public)
  def index
    @pills = Pill.all.group_by(&:group)
  end
end
