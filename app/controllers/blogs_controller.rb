class BlogsController < ApplicationController
  def feature; end
  def index
    @blogs = Blog.published
    @categories = BlogCategory.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
