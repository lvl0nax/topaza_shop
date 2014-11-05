ActiveAdmin.register PaymentType do
  permit_params :name, :message
  form do |f|
    f.inputs 'Название' do
      f.input :name, label: false
    end
    f.inputs 'Сообщение после оплаты' do
      f.input :message, label: false
    end
    f.actions
  end
end
