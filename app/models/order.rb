class Order < ActiveRecord::Base

  #validates :name, :email, :dress_id, :city, :address, :payment_type_id, :phone, presence: true
  validates :name, :email, :dress_id, :payment_type_id, :phone, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                                    message: "Некорректный электронный адрес" }
  validates :phone, :numericality => true,
            :length => { :minimum => 7, :maximum => 12 }


  belongs_to :dress
  belongs_to :payment_type

  before_save :add_price_content
  before_validation :fix_phone
  private
  def add_price_content
    #self.price_content = {dress_price: self.dress.price, delivery_price: 800, dress_name: self.dress.title}.to_json
    dress_price = dress.new_price.nil? ? dress.price : dress.new_price
    self.price_content = {dress_price: dress_price, delivery_price: 0, dress_name: dress.title}.to_json
  end

  def fix_phone
    self.phone.sub!('+', '')
  end
end
