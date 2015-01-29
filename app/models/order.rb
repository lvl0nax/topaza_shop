class Order < ActiveRecord::Base

  validates :name, :email, :dress_id, :city, :address, :payment_type_id, :phone, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                                    message: "Не корректный электронный адрес" }
  validates :phone, :numericality => true,
            :length => { :minimum => 7, :maximum => 12 }


  belongs_to :dress
  belongs_to :payment_type

  before_save :add_price_content
  before_validation :fix_phone
  private
  def add_price_content
    self.price_content = {dress_price: self.dress.price, delivery_price: 800, dress_name: self.dress.title}.to_json
  end

  def fix_phone
    self.phone.sub!('+', '')
  end
end
