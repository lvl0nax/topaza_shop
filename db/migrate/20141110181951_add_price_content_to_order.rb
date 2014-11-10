class AddPriceContentToOrder < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION IF NOT EXISTS hstore;'
    enable_extension :hstore
    add_column :orders, :price_content, :hstore
  end
end
