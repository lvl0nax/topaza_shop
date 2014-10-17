class AddPictureToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :picture, :string
  end
end
