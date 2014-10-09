ActiveAdmin.register Dress do
  form partial: 'admin/dresses/form'
  show do |dress|
    attributes_table do
      row :title
      row :description
      row :size
      row :material
      row :price
      row :slug
      row :seo_title
      row :seo_description
      row :seo_keywords
      row :main_image do
        image_tag(dress.main_image.name.url(:dress_big))
      end
      row :not_main_images do
        ul do
          dress.not_main_images.each do |image|
            li do
              image_tag(image.name.url(:dress_small))
            end
          end
        end
      end
    end
  active_admin_comments
  end

  controller do
    def permitted_params
      params.permit dress: [:title, :description, :size, :material, :price, :seo_title, :seo_description, :seo_keywords]
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    def update
      @dress = Dress.friendly.find(params[:id])
      params[:image][:name].each {|name| @dress.images << Image.create(name: name)} if params[:image].present?

      respond_to do |format|
        if @dress.update_attributes(permitted_params[:dress])
          format.html { redirect_to admin_dresses_path, notice: 'Dress was successfully updates.' }
        else
          format.html { render action: 'new', notice: 'Dress not updated.' }
        end
      end
    end

    def create
      @dress = Dress.new(permitted_params[:dress])
      params[:image][:name].each {|name| @dress.images << Image.create(name: name)} if params[:image].present?

      respond_to do |format|
        if @dress.save
          format.html { redirect_to admin_dresses_path, notice: 'Dress was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Dress not created.' }
        end
      end
    end
  end
end
