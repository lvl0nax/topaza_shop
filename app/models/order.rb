class Order < ActiveRecord::Base
  belongs_to :dress
  belongs_to :payment_type
end