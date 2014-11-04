class OrdersController < ApplicationController
  def thanks
    @banners = Banner.in_thanks
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @dress = Dress.find(params[:dress_id])
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to thanks_order_path(@order.id) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :phone, :country, :city, :address, :zip_code, :payment_type_id)
  end
end