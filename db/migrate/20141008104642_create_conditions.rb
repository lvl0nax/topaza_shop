class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :title
      t.text :description
      t.string :seo_title
      t.string :seo_description
      t.string :seo_keywords
    end
  end
end
