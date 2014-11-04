class AddMessageToPaymentType < ActiveRecord::Migration
  def change
    add_column :payment_types, :message, :text
  end
end
