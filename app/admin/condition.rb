ActiveAdmin.register Condition do
  form partial: 'admin/conditions/form'
  show do |condition|
    attributes_table do
      row :title
      row :description
      row :seo_title
      row :seo_description
      row :seo_keywords
      row :image do
        image_tag(condition.image.name.url)
      end
    end
    active_admin_comments
  end

  controller do
    def permitted_params
      params.permit condition: [:title, :description, :seo_title, :seo_description, :seo_keywords]
    end

    def update
      @condition = Condition.find(params[:id])
      if params[:image].present?
        @condition.images.delete_all
        params[:image][:name].each {|name| @condition.images << Image.create(name: name)}
      end

      respond_to do |format|
        if @condition.update_attributes(permitted_params[:condition])
          format.html { redirect_to admin_conditions_path, notice: 'Condition was successfully updates.' }
        else
          format.html { render action: 'new', notice: 'Condition not updated.' }
        end
      end
    end

    def create
      @condition = Condition.new(permitted_params[:condition])
      params[:image][:name].each {|name| @condition.images << Image.create(name: name)} if params[:image].present?

      respond_to do |format|
        if @condition.save
          format.html { redirect_to admin_conditions_path, notice: 'Condition was successfully created.' }
        else
          format.html { render action: 'new', notice: 'Condition not created.' }
        end
      end
    end
  end
end
