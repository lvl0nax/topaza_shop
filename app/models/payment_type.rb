class PaymentType < ActiveRecord::Base
  validates_presence_of :name
  attr_readonly :name
  has_many :orders
end