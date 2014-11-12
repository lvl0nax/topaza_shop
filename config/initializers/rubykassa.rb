# -*- encoding : utf-8 -*-
Rubykassa.configure do |config|
  config.login = ENV['LOGIN']
  config.first_password = ENV['PASSWORD_1']
  config.second_password = ENV['PASSWORD_2']
  config.mode = :test # or :production
  config.http_method = :get # or :post
  config.xml_http_method = :get # or :post


  # Result callback is called in RobokassaController#paid action if valid signature
  # was generated. It should always return "OK#{ invoice_id }" string, so implement
  # your custom logic above `render text: notification.success` line

  #config.result_callback = ->(notification) { render text: notification.success }

  # Define success or failure callbacks here like:

  #config.success_callback = ->(notification) { redirect_to thanks_order_path(params[:InvId]) }
  config.fail_callback = ->(notification) { redirect_to root_path }
end
