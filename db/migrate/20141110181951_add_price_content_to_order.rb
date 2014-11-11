class AddPriceContentToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :price_content, :text
  end
end
