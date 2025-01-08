class StaticPagesController < ApplicationController
  def index
    @small_projects = Project.order(updated_at: :desc).pluck(:short_title, :short_description).map do |title, description|
      {
        title: title,
        description: description,
        path: "/#{title.parameterize}"
      }
    end
  end


  def info; end

  def resume
    @pills = Pill.all
  end
end
