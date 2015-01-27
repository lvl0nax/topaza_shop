class AddNewPriceToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :new_price, :integer, default: nil
  end
end
