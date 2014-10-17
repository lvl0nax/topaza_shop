class Condition < ActiveRecord::Base
  validates_associated :images
  validates_presence_of :title, :description, :seo_title, :seo_keywords, :seo_description

  has_one :images, as: :imageable, dependent: :destroy

  def image
    images.first
  end
end