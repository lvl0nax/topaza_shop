class Condition < ActiveRecord::Base
  validate :validate_images_size
  validates_associated :images
  validates_presence_of :title, :description, :seo_title, :seo_keywords, :seo_description

  has_many :images, as: :imageable, dependent: :destroy

  def validate_images_size
    errors.add(:images, "много изображений") if images.size > 1
  end

  def image
    images.first
  end
end