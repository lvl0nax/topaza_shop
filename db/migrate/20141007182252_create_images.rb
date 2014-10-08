class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.integer :dress_id
      t.boolean :main
    end
  end
end
