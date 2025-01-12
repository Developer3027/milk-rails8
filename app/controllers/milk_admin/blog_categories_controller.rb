class MilkAdmin::BlogCategoriesController < ApplicationController
  def new
    @blog_category = BlogCategory.new
  end

  def create
    @blog_category = BlogCategory.new(blog_category_params)

    if @blog_category.save
      redirect_to blog_categories_path, notice: "Category for Blog was successfully created."
    else
      render :new
    end
  end

  def update
    @blog_category = BlogCategory.find(params[:id])

    if @blog_category.update(blog_category_params)
      redirect_to blog_categories_path, notice: "Category for Blog was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @blog_category = BlogCategory.find(params[:id])
    @blog_category.destroy
    redirect_to categories_path, notice: "Category for Blog was successfully destroyed."
  end

  private

  def blog_category_params
    params.require(:blog_category).permit(:title, :description)
  end
end
