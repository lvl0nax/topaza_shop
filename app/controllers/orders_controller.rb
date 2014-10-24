class OrdersController < ApplicationController
  def thanks
    @banners = Banner.in_thanks
  end

  def new
    @order = Order.new
    @dress = Dress.first
  end
end