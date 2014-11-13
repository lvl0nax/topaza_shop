class AddPositionToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :position, :integer
  end
end
