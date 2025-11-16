# app/controllers/milk_admin/tasks_controller.rb

class MilkAdmin::TasksController < ApplicationController
  before_action :authenticate_milk_admin!
  before_action :set_project
  before_action :set_task, only: [ :edit, :update, :destroy ]

  # POST /milk_admin/projects/1/tasks
  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to milk_admin_project_path(@project), notice: "Task created."
    else
      # If it fails, we re-render the project's show page
      # We need to load all the other variables that show page needs
      @tasks = @project.tasks.order(:created_at)
      @progress = @project.progress_percentage.round
      @progress_time = @project.progress_percentage_by_time

      # Now render the 'show' template from the 'projects' controller
      render "milk_admin/projects/show", status: :unprocessable_entity
    end
  end

  # GET /milk_admin/projects/1/tasks/1/edit
  def edit
    # @project and @task are already set
  end

  # PATCH/PUT /milk_admin/projects/1/tasks/1
  def update
    if @task.update(task_params)
      redirect_to milk_admin_project_path(@project), notice: "Task updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /milk_admin/projects/1/tasks/1
  def destroy
    @task.destroy
    redirect_to milk_admin_project_path(@project), notice: "Task deleted.", status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :estimated_time, :completed)
  end
end
