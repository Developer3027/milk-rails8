class ZukeController < ApplicationController
  def index; end

  def music
    @songs = Song.all
  end
end
