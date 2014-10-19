class Dress < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :description, :size, :material, :price, :images
  validates_associated :images
  before_save :set_main_image

  has_many :images, as: :imageable, dependent: :destroy

  def set_main_image
    images.first.update_attribute('main', true) if main_image.blank?
  end

  def not_main_images
    images.collect{|image| image unless image.main}.compact
  end

  def main_image
    images.where(main: true).first
  end
end
