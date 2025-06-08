class ApplicationController < ActionController::Base
  # Set the default url options for use of blog image url
  before_action :set_default_url_options
  # Set meta tags
  before_action :set_meta_data
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # Ensure the admin layout is used when signed in
  layout :layout_by_resource

  private
  # Choose the layout based on whether the user is signed in or not.
  #
  # If the user is signed in, it will use the milk_admin layout.
  # Otherwise, it will use the application layout.
  def layout_by_resource
    if milk_admin_signed_in?
      "milk_admin"
    else
      "application"
    end
  end

  # app/controllers/application_controller.rb
  def set_meta_data
    set_meta_tags site: "dev-mason-roberts.com",
                  title: "Developer3027 blog | Mason Roberts",
                  reverse: true,
                  separator: "|",
                  description: "Developing the web with Ruby on Rails. Mason Roberts has built a corner of the internet to showcase what he can do as a designer and developer as well as be both a client hub and learning center.",
                  keywords: "Ruby, Rails, RoR, Ruby on Rails, Node, React, Vue, JavaScript, HTML, CSS, Express, PG, PostgreSQL, MongoDB, Mongoose, MERN, MEAN, MERN Stack, Full Stack, Web Development, Web Design, Web Designer, Web Developer, Mason Roberts, Developer 3027",
                  canonical: request.original_url,
                  noindex: !Rails.env.production?,
                  og: {
                    title: :title,
                    type: "website",
                    url: request.original_url,
                    image: "https://milk-blog.s3.us-east-2.amazonaws.com/og-image.png",
                    image_alt: "Mason Roberts platform",
                    site_name: "dev-mason-roberts.com"
                  }
  end


  # Set the default host for generating urls based on the request host.
  def set_default_url_options
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
end
