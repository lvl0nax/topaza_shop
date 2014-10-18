class DressesController < ApplicationController
  def index
    @dresses = Dress.all
  end
  def show
    @dress = Dress.find(params[:id])
  end
end
