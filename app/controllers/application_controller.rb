class ApplicationController < ActionController::Base
  # Set the default url options for use of blog image url
  before_action :set_default_url_options
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


  # Set the default host for generating urls based on the request host.
  def set_default_url_options
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
end
