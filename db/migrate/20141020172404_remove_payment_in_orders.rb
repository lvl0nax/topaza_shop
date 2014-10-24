class RemovePaymentInOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :payment
  end
end
