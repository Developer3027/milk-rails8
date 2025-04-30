class ZukeController < ApplicationController
  def index; end

  def music
    @view_mode = params[:view] || session[:song_view_mode] || "card"
    session[:song_view_mode] = @view_mode
    @songs = Song.all
  end
end
