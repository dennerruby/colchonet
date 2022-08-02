class HomeController < ApplicationController
  def index
    @roms = Rom.take(3)
  end
end