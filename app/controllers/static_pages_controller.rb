class StaticPagesController < ApplicationController
  def index
    @small_projects = Project.where(featured: true).order(updated_at: :desc).pluck(:short_title, :short_description).map do |title, description|
      {
        title: title,
        description: description,
        path: "/#{title.parameterize}"
      }
    end
  end
end
