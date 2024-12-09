class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  layout :layout_by_resource

  private
  def layout_by_resource
    if milk_admin_signed_in?
      "milk_admin"
    else
      "application"
    end
  end
end
