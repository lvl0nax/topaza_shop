class AddPriceContentToOrder < ActiveRecord::Migration
  def change
    enable_extension :hstore
    add_column :orders, :price_content, :hstore
  end
end
