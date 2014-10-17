class Condition < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  validates_presence_of :title, :description, :picture, :seo_title, :seo_keywords, :seo_description
end