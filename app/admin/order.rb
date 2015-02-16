ActiveAdmin.register Order do
  actions :index, :show
  form partial: 'admin/orders/form'
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column :country
    column :city
    column :address
    column :payment_type do |order|
      order.payment_type.name unless order.payment_type.nil?
    end
    column :paid do |order|
      order.paid ? 'Оплачено' : 'Не оплачено'
    end
    actions
  end
end
