class HomeController < ApplicationController
  def index
  	@bookcovers = Bookcover.all
  end

  def show
  	@show_cover = Bookcover.find(params[:format])
  end
end
