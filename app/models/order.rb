class Order < ActiveRecord::Base

  validates :name, :email, :dress_id, :city, :address, :payment_type_id, :phone, presence: true

  belongs_to :dress
  belongs_to :payment_type

  before_save :add_price_content
  private
  def add_price_content
    self.price_content = {dress_price: self.dress.price, delivery_price: 800, dress_name: self.dress.title}
  end
end
