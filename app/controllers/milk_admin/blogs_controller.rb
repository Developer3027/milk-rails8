# Blog Controller for Milk Admin
class MilkAdmin::BlogsController < ApplicationController
  # Ensure milk admin is logged in for CRUD actions
  before_action :authenticate_milk_admin!
  # Set blog for methods that need it
  before_action :set_blog, only: [ :edit, :update, :destroy, :destroy_image ]
  # Set blog categories for methods that need it
  before_action :set_blog_categories, only: [ :new, :create, :edit, :update ]

  # GET /milk_admin/blogs
  #
  # Returns all blogs. The `format.html` response is the default view for
  # this controller and is used for the index page of the milk admin dashboard.
  # The `format.json` response is used by the JavaScript frontend to populate the data tables.
  def index
    @blogs = Blog.all
    respond_to do |format|
      format.html
      format.json { render json: @blogs.as_json(
        only: [ :id, :title, :content, :published_at, :image_url ],
        include: {
          blog_category: { only: [ :title ] },
          milk_admin: { only: [ :email ] }
        }
      )}
    end
  end

  # GET /milk_admin/blogs/new
  #
  # Initializes a new Blog object.
  # The `new` action is used to display a form for creating a new blog post.

  def new
    @blog = Blog.new
  end

  def edit; end

  # POST /milk_admin/blogs
  #
  # Creates a new blog post using provided blog parameters.
  # Associates the blog post with the current milk admin.
  #
  # On success:
  # - Sets the image URL if an image is attached.
  # - Redirects to the blogs listing page with a success notice.
  # - Renders the blog as JSON with a 201 status code.
  #
  # On failure:
  # - Renders the new blog form with an unprocessable entity status.
  # - Renders the errors as JSON with an unprocessable entity status.

  def create
    @blog = Blog.new(blog_params)
    @blog.milk_admin_id = current_milk_admin.id

    respond_to do |format|
      if @blog.save
        @blog.process_body  # Call process_body to ensure TOC and body are updated
        set_image_url(@blog)
        format.html { redirect_to milk_admin_blogs_path, notice: "Blog was successfully created." }
        format.json { render json: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milk_admin/blogs/1
  #
  # Updates a blog using the given blog parameters.
  # Associates the blog post with the current milk admin.
  #
  # On success:
  # - Sets the image URL if an image is attached.
  # - Redirects to the blogs listing page with a success notice.
  # - Renders the blog as JSON with a 201 status code.
  #
  # On failure:
  # - Renders the new blog form with an unprocessable entity status.
  # - Renders the errors as JSON with an unprocessable entity status.
  def update
    @blog.milk_admin_id = current_milk_admin.id
    respond_to do |format|
      if @blog.update(blog_params)
        @blog.process_body  # Call process_body to ensure TOC and body are updated
        set_image_url(@blog) if @blog.blog_image.attached?
        format.html { redirect_to milk_admin_blogs_path, notice: "Blog was successfully updated." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milk_admin/blogs/1
  #
  # Destroys a blog and any associated image.
  #
  # On success:
  # - Redirects to the blogs listing page with a success notice.
  # - Renders the blog as JSON with a 204 status code.
  #
  # On failure:
  # - Renders the new blog form with an unprocessable entity status.
  # - Renders the errors as JSON with an unprocessable entity status.
  def destroy
    respond_to do |format|
      if @blog.destroy
        format.html { redirect_to milk_admin_blogs_path, status: :see_other, notice: "Blog and image were successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to milk_admin_blogs_path, alert: "Failed to destroy the blog." }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milk_admin/blogs/1/destroy_image
  #
  # Destroys the associated image from the blog.
  #
  # On success:
  # - Redirects to the edit page of the blog with a success notice.
  # - Renders the blog as JSON with a 204 status code.
  #
  # On failure:
  # - Renders the edit page of the blog with an unprocessable entity status.
  # - Renders the errors as JSON with an unprocessable entity status.
  def destroy_image
    @blog.blog_image.purge_later

    respond_to do |format|
      if @blog.blog_image.attached?
        @blog.update(image_url: nil)
        format.html { redirect_to edit_milk_admin_blog_path(@blog) }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@blog, "blog_image")) }
      else
        format.html { redirect_to edit_milk_admin_blog_path(@blog), alert: "No image to remove." }
      end
    end
  end

  private

  # Strong parameters method for blog attributes.
  #
  # Ensures only the permitted attributes are allowed from the params hash.
  #
  # @return [ActionController::Parameters] filtered parameters for creating or updating a blog.

  def blog_params
    params.require(:blog).permit(:blog_image,
                                 :title,
                                 :subtitle,
                                 :content,
                                 :image_url,
                                 :published_at,
                                 :milk_admin_id,
                                 :blog_category_id)
  end

  # Sets the @blog_categories instance variable.
  #
  # This method is called by the before_action callback in the BlogController,
  # This method retrieves all blog categories from the database,
  # orders them by their title, and assigns them to the @blog_categories
  # instance variable for use in views or other controller actions.

  def set_blog_categories
    @blog_categories = BlogCategory.all.order(:title)
  end

  # Finds the blog with the given id and assigns it to the @blog instance variable.
  #
  # This method is called by the before_action callback in the BlogController and
  # is used by multiple actions in the controller to fetch the blog related to
  # the current request.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Sets the image_url attribute of a blog to the URL of the associated image.
  #
  # @param blog [Blog] the blog to set the image_url attribute for.
  #
  # @note This method is called after creating or updating a blog when the blog has an associated image.
  # @note This method is called by the before_action callback in the BlogController and is used by
  # multiple actions in the controller to fetch the blog related to the current request.
  # @note The default host url is set in the application controller.
  def set_image_url(blog)
    if blog.blog_image.attached?
      blog.update(image_url: Rails.application.routes.url_helpers.url_for(blog.blog_image))
    end
  end
end
