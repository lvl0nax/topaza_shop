ActiveAdmin.register Image do
  show do |image|
    row :name do
      image_tag image.name.url
    end
  end

  member_action :main, method: :get do
    @image = Image.find(params[:id].to_i)
    @dress = Dress.find(@image.dress.id)
    @old_main_image = @dress.images.where(main: true).first
    @old_main_image.update_attribute('main', false) if @old_main_image.present?
    notice = @image.update_attribute('main', true) ? 'Image was successfully mainly' : 'Image not main'
    redirect_to "/admin/dresses/#{@dress.id}/edit", notice: "#{notice}"
  end

  controller do
    def destroy
      @image = Image.find(params[:id].to_i)
      @dress = Dress.find(image.id)
      notice = @image.destroy ? 'Image was successfully destroyed' : 'Image not destroyed'
      redirect_to "/admin/dresses/#{@dress.id}/edit", notice: "#{notice}"
    end
  end
end
