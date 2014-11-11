class RobokassaController < ApplicationController
  before_filter :create_notification

  def paid
    if @notification.valid_result_signature?
      @order = Order.find(params[:InvId])
      @order.update_attribute('paid', true)
      instance_exec @notification, &Rubykassa.result_callback
    else
      instance_exec @notification, &Rubykassa.fail_callback
    end
  end

  def success
    if @notification.valid_success_signature?
      @order = Order.find(params[:InvId])
      redirect_to thanks_order_path(@order.id)
    else
      instance_exec @notification, &Rubykassa.fail_callback
    end
  end

  def fail
    instance_exec @notification, &Rubykassa.fail_callback
  end

  private

  def create_notification
    @notification = Rubykassa::Notification.new request.query_parameters
  end
end
