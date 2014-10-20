class OrdersController < ApplicationController
  def thanks
    @banners = Banner.in_main
  end
end