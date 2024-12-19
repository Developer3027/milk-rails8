class MilkAdminController < ApplicationController
  before_action :authenticate_milk_admin!

  def dashboard
    @milk_admin = current_milk_admin
  end

  def admin_milk_blog; end

  private
end
