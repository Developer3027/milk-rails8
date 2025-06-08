class BlogsController < ApplicationController
  def feature; end
  def index
    @blogs = Blog.published
    @categories = BlogCategory.all
    @q = Blog.published.ransack(params[:q])
    @blogs = @q.result.order(published_at: :desc)
    # @pagy, @blogs = pagy(@blogs, items: 10)
    @categories = BlogCategory.all

    # set_meta_tags(
    #   title: "Developer3027 blog | Mason Roberts",
    #   description: "Developer3027 blog | Mason Roberts is a reference to my learning journey. Most of it revolves around building web apps with Ruby on Rails. Mason Roberts has built a corner of the internet to showcase what he can do as a designer and developer as well as be both a client hub and learning center.",
    #   keywords: "Blog, Rails, Ruby, RoR, Ruby on Rails, Express, Node, React, Vue, JavaScript, HTML, CSS, PostgreSQL, MongoDB, Mongoose, MERN, MEAN, MERN Stack, Full Stack, Web Development, Web Design, Web Designer, Web Developer, Mason Roberts, Developer 3027",
    #   og: {
    #     title: "Developer3027 blog | Mason Roberts",
    #     description: "Developer3027 blog | Mason Roberts is a reference to my learning journey. Most of it revolves around building web apps with Ruby on Rails. Mason Roberts has built a corner of the internet to showcase what he can do as a designer and developer as well as be both a client hub and learning center.",
    #     image: image_url("og-image.png")
    #   }
    # )
  end

  def show
    @blog = Blog.published.friendly.find(params[:slug])
    set_meta_tags title: @blog.title,
                  description: @blog.subtitle || @blog.meta_description,
                  # keywords: @blog.keywords,
                  og: {
                    title: @blog.title,
                    description: @blog.subtitle,
                    image: @blog.blog_image || @blog.image_url
                  }
  end
end
