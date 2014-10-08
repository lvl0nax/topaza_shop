class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.integer :dress_id
      t.boolean :main
      t.integer :imageable_id
      t.string :imageable_type
    end
  end
end
