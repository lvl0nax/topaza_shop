module OrdersHelper
  def price(dress)
    dress.new_price.nil? ? get_price(dress.price) : get_price(dress.new_price)
  end

  private
  def get_price(price)
    number_to_currency(price, separator: ' ', delimiter: ' ', precision: 0, unit: '')
  end
end
