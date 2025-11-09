class MilkAdminController < ApplicationController
  before_action :authenticate_milk_admin!

  def dashboard
    @milk_admin = current_milk_admin
    @contacts = Contact.all
  end

  def admin_milk_blog; end

  # def admin_resume
  #   @resume = Resume.new
  #   @projects = @resume.projects.build
  #   @pills = @resume.pills.build
  # end

  # def create_resume
  #   @resume = Resume.new(resume_params)

  #   if @resume.save
  #     redirect_to milk_admin_root_path, notice: "Resume was successfully created."
  #   else
  #     render :admin_resume # Render the form again with error messages
  #   end
  # end

  # def create_project
  #   @project = Project.new(project_params)

  #   if @project.save
  #     redirect_to milk_admin_root_path, notice: "Project was successfully created."
  #   else
  #     render admin_project # Render the form again with error messages
  #   end
  # end

  # def create_pill
  #   @pill = Pill.new(pill_params)

  #   if @pill.save
  #     redirect_to milk_admin_root_path, notice: "Pill was successfully created."
  #   else
  #     render admin_pill # Render the form again with error messages
  #   end
  # end

  private

  # def contact_params
  #   params.require(:contact).permit(:f_name, :l_name, :email, :description)
  # end

  # def resume_params
  #   params.require(:resume).permit(:title, :full_name, :addr, :citystatezip, :email, :linkedin, :code_1, :code_2,
  #                                   projects_attributes: [ :title, :description, :code_url, :design_url, :live_url, :resume_id ],
  #                                   pills_attributes: [ :skill, :version, :version_color, :resume_id ])
  # end
end
