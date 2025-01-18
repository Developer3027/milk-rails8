# Projects controller for the project model in the milk_admin namespace
class MilkAdmin::ProjectsController < ApplicationController
  before_action :authenticate_milk_admin!
  before_action :set_project, only: [ :edit, :update, :destroy, :destroy_image ]

  # GET /projects
  #
  # Displays a list of all projects.
  def index
    @projects = Project.all
  end

  # GET /projects/new
  #
  # Displays a form for creating a new project.
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  #
  # Displays a form for editing an existing project.
  def edit; end

  # POST /projects
  #
  # Creates a new project using the given project information.
  #
  # Redirects to the projects listing page on success.
  # json endpoint return object with 201 status code.
  # Redirects to the projects new page on failure.
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to milk_admin_projects_path, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  #
  # Updates a project using the given project information.
  #
  # Redirects to the projects listing page on success.
  # json endpoint return object with 200 status code.
  # Redirects to the projects edit page on failure.
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to milk_admin_projects_path, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # Soft deletes the project.
  #
  # Redirects to the projects listing page on success.
  def destroy
    respond_to do |format|
    @project.project_image.purge_later
    @project.destroy!
      format.html { redirect_to milk_admin_projects_path, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # DELETE /projects/1/destroy_image
  #
  # Removes the uploaded image from the project.
  #
  # Redirects to the edit page of the project on success.
  def destroy_image
    @project.project_image.purge_later

    respond_to do |format|
      if @project.project_image.attached?
        format.html { redirect_to edit_ilk_admin_project_path(@project) }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@project, "project_image")) }
      else
        format.html { redirect_to edit_milk_admin_project_path(@project), alert: "No image to remove." }
      end
    end
  end

  private

  # The permitted parameters for a Project object.
  #
  # @return [ActionController::Parameters] The whitelist of parameters for a
  #   Project object.
  def project_params
    params.require(:project).permit(:project_image,
                                    :short_title,
                                    :short_description,
                                    :title,
                                    :description,
                                    :short_title,
                                    :short_description,
                                    :code_url,
                                    :design_url,
                                    :live_url,
                                    :resume_id
                                    )
  end

  # Finds a project by id and assigns it to the @project instance variable.
  def set_project
    @project = Project.find(params[:id])
  end
end
