ActiveAdmin.register Order do
  actions :index, :show
  form partial: 'admin/orders/form'
end
