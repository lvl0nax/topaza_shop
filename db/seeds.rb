['Оплата банковской картой', 'Банковский перевод'].each do |name|
  PaymentType.create(name: name)
end
