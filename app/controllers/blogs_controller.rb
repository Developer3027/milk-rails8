class BlogsController < ApplicationController
  def feature; end
  def index
    @blogs = Blog.published
    @categories = BlogCategory.all
    @q = Blog.published.ransack(params[:q])
    @blogs = @q.result.order(published_at: :desc)
    # @pagy, @blogs = pagy(@blogs, items: 10)
    @categories = BlogCategory.all
  end

  def show
    @blog = Blog.published.find(params[:id])
  end
end
