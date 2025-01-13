class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @categories = BlogCategory.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
