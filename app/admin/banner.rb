ActiveAdmin.register Banner do
  permit_params :title, :url, :button_name, positions: []
  form partial: 'admin/banners/form'
  show do
    render 'admin/banners/show'
  end
end
