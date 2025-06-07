class SaltAndTarController < ApplicationController
  def index; end

  def archive
    @videos = SaltAndTarVideo.where(published: true).order(:position)
    @selected_video = @videos.first # Default to first video
  end
end
