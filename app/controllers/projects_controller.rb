
class ProjectsController < ApplicationController
  # GET /projects/index (public)
  def index
    @projects = Project.where(featured: false)
  end
end
