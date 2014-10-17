class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :positions
      t.string :url
      t.string :button_name
    end
  end
end
