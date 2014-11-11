class OrdersController < ApplicationController
  def thanks
    @banners = Banner.in_thanks
    @order = Order.find(params[:id])
    @message = @order.payment_type.name == 'Банковский перевод' ? @order.payment_type.message + ' '+ @order.email : @order.payment_type.message
  end

  def new
    @order = Order.new
    @dress = Dress.find(params[:dress_id])
  end

  def create
    @dress = Dress.find(params[:order].delete(:dress_id))
    @order = @dress.orders.new(order_params)

    if @order.save
      total = JSON.parse(@order.price_content)['dress_price'] + JSON.parse(@order.price_content)['delivery_price']
      if @order.payment_type_id == 1
        redirect_to Rubykassa.pay_url(@order.id, total, {})
      else
        redirect_to thanks_order_path(@order.id)
      end
    else
      render action: 'new'
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :phone, :country, :city, :address, :zip_code, :payment_type_id)
  end
end
