class RenamePaymentIdToPaymentTypeIdInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :payment_id, :payment_type_id
  end
end
