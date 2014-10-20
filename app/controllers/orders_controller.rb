class OrdersController < ApplicationController
  def thanks
    @banners = Banner.in_thanks
  end
end