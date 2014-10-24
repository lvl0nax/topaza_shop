class OrdersController < ApplicationController
  def thanks
    @banners = Banner.in_thanks
  end

  def new
    @order = Order.new
    @dress = Dress.first
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to thanks_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :phone, :country, :city, :address, :zip_code, :payment_id)
  end
end