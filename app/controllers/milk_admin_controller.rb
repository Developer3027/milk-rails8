class MilkAdminController < ApplicationController
  before_action :authenticate_milk_admin!

  def dashboard
    @milk_admin = current_milk_admin

    # Blog metrics
    @total_blogs = Blog.count
    @published_blogs = Blog.published.count
    @draft_blogs = Blog.draft.count
    @scheduled_blogs = Blog.scheduled.count
    @blogs_this_month = Blog.where("created_at >= ?", Time.current.beginning_of_month).count
    @recent_blogs = Blog.sorted.limit(5)

    # View count metrics
    @total_views = Blog.sum(:views_count)
    @average_views = @total_blogs > 0 ? (@total_views.to_f / @total_blogs).round(1) : 0
    @most_viewed_blog = Blog.order(views_count: :desc).first
    @top_viewed_blogs = Blog.published.order(views_count: :desc).limit(5)

    # Calculate blog trends
    last_month_start = 1.month.ago.beginning_of_month
    last_month_end = 1.month.ago.end_of_month
    @blogs_last_month = Blog.where(created_at: last_month_start..last_month_end).count
    @blog_trend = calculate_trend(@blogs_last_month, @blogs_this_month)

    # Project metrics
    @total_projects = Project.count
    @projects_this_month = Project.where("created_at >= ?", Time.current.beginning_of_month).count
    @recent_projects = Project.order(updated_at: :desc).limit(5)

    # Contact/Message metrics
    @total_contacts = Contact.count
    @recent_contacts = Contact.order(created_at: :desc).limit(3)
    @unread_contacts = Contact.where("created_at >= ?", 7.days.ago).count

    # Recent activity - combine blogs and projects
    @recent_activities = build_recent_activities
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

  def calculate_trend(previous, current)
    return 0 if previous.zero?
    ((current - previous).to_f / previous * 100).round(1)
  end

  def build_recent_activities
    activities = []

    # Add recent blogs
    Blog.order(created_at: :desc).limit(5).each do |blog|
      activities << {
        type: "blog",
        action: blog.published? ? "Published" : (blog.scheduled? ? "Scheduled" : "Created draft"),
        title: blog.title,
        timestamp: blog.created_at,
        color: blog.published? ? "green" : (blog.scheduled? ? "blue" : "gray")
      }
    end

    # Add recent projects
    Project.order(created_at: :desc).limit(5).each do |project|
      activities << {
        type: "project",
        action: "Updated project",
        title: project.title,
        timestamp: project.updated_at,
        color: "orange"
      }
    end

    # Sort by timestamp and take most recent 10
    activities.sort_by { |a| a[:timestamp] }.reverse.take(10)
  end

  # def contact_params
  #   params.require(:contact).permit(:f_name, :l_name, :email, :description)
  # end

  # def resume_params
  #   params.require(:resume).permit(:title, :full_name, :addr, :citystatezip, :email, :linkedin, :code_1, :code_2,
  #                                   projects_attributes: [ :title, :description, :code_url, :design_url, :live_url, :resume_id ],
  #                                   pills_attributes: [ :skill, :version, :version_color, :resume_id ])
  # end
end
