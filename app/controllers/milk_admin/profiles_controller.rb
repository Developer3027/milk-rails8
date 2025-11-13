# Profile Controller for Milk Admin
class MilkAdmin::ProfilesController < ApplicationController
  # Ensure milk admin is logged in
  before_action :authenticate_milk_admin!
  before_action :set_profile

  # GET /milk_admin/profile
  def show
    render layout: false if turbo_frame_request?
  end

  # GET /milk_admin/profile/edit
  def edit
    render layout: false if turbo_frame_request?
  end

  # PATCH/PUT /milk_admin/profile
  def update
    if @profile.update(profile_params)
      redirect_to milk_admin_profile_path, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity, layout: !turbo_frame_request?
    end
  end

  private

  def set_profile
    @profile = current_milk_admin.profile || current_milk_admin.create_profile
  end

  def profile_params
    params.require(:milk_admin_profile).permit(
      :first_name,
      :last_name,
      :bio,
      :avatar,
      social_links: {}
    )
  end
end
