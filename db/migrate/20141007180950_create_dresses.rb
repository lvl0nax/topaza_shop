class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.string :title
      t.string :size
      t.string :material
      t.text :description
      t.integer :price
      t.string :seo_title
      t.string :seo_description
      t.string :seo_keywords
      t.string :slug, uniq: true
    end
  end
end
