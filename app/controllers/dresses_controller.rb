class DressesController < ApplicationController
  def index
    @dresses = Dress.all
    @banners = Banner.in_dresses
  end
  def show
    @dress = Dress.friendly.find(params[:id])
  end
end
