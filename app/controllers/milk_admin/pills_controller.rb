class MilkAdmin::PillsController < ApplicationController
  before_action :authenticate_milk_admin!
  before_action :set_pill, only: [ :edit, :update, :destroy ]
  before_action :set_colors_groups, only: [ :new, :edit, :update ]

  def index
    @pills = Pill.all.group_by(&:group)
  end

  def new
    @pill = Pill.new
  end

  def create
    @pill = Pill.new(pill_params)

    if @pill.save
      redirect_to pills_path, notice: "Pill was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @pill.update(pill_params)
      redirect_to pills_path, notice: "Pill was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pill.destroy
    redirect_to pills_path, notice: "Pill was successfully destroyed."
  end

  private

  def pill_params
    params.require(:pill).permit(:skill, :version, :group, :version_color, :resume_id)
  end

  def set_pill
    @pill = Pill.find(params[:id])
  end

  def set_colors_groups
    @colors_groups = Pill.pluck(:version_color, :group).uniq.sort
  end
end
