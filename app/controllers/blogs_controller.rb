class BlogsController < ApplicationController
  def feature; end
  def index
    @featured_blog = Blog.where(featured: true).first
    @blogs = Blog.published
    @categories = BlogCategory.all

    if @featured_blog.present?
      @blogs = @blogs.where.not(id: @featured_blog.id)
    end

    @q = Blog.published.where.not(id: @featured_blog.id).ransack(params[:q])
    @blogs = @q.result.order(published_at: :desc)
    # @pagy, @blogs = pagy(@blogs, items: 10)
    # @categories = BlogCategory.all

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

    # Track blog views with session-based deduplication
    track_blog_view(@blog)

    # Generate absolute URLs for social sharing
    blog_url = blog_url(@blog)
    image_url = @blog.blog_image.attached? ? url_for(@blog.blog_image) : nil

    set_meta_tags(
      title: @blog.title,
      description: @blog.subtitle || @blog.title,
      og: {
        title: @blog.title,
        description: @blog.subtitle || @blog.title,
        type: "article",
        url: blog_url,
        image: image_url,
        site_name: "Rogue Media Lab"
      },
      twitter: {
        card: "summary_large_image",
        title: @blog.title,
        description: @blog.subtitle || @blog.title,
        image: image_url
      }
    )
  end

  private

  def track_blog_view(blog)
    # Initialize viewed_blogs hash if it doesn't exist
    session[:viewed_blogs] ||= {}

    # Get the last view timestamp for this blog (or 0 if never viewed)
    last_viewed_at = session[:viewed_blogs][blog.id.to_s].to_i

    # Only increment view count if not viewed in the last hour
    if last_viewed_at < 1.hour.ago.to_i
      blog.increment!(:views_count)
      session[:viewed_blogs][blog.id.to_s] = Time.current.to_i
    end
  end
end
