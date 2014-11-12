class RobokassaController < ApplicationController
  before_filter :create_notification

  def paid
    if @notification.valid_result_signature?
      @order = Order.find(params[:InvId])
      if @order.update_attribute('paid', true)
        instance_exec @notification, &Rubykassa.result_callback
      else
        fail
      end
    else
      fail
    end
  rescue
    fail
  end

  def success
    if @notification.valid_success_signature?
      @order = Order.find(params[:InvId])
      redirect_to thanks_order_path(@order.id)
    else
      fail
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
