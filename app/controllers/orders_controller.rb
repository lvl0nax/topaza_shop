class OrdersController < ApplicationController
  include Banners
  def thanks
    set_banners
  end
end