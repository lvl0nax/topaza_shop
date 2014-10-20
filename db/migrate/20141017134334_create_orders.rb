class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :country
      t.string :city
      t.string :address
      t.integer :zip_code
      t.belongs_to :dress
      t.string :payment
    end
  end
end
