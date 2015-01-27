module DressesHelper
  def show_price(dress)
    if dress.new_price.nil?
      content_tag(:div, get_price(dress.price), class: 'dress_main_info__price')
    else
      content_tag(:div, get_price(dress.price), class: 'dress_main_info__old_price') +
      content_tag(:div, get_price(dress.new_price), class: 'dress_main_info__new_price')
    end
  end

  private
  def get_price(price)
    number_to_currency(price, separator: ',', delimiter: ' ', precision: 0, format: '%n %u', unit: 'P')
  end
end
