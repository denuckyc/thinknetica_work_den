# Enter 'stop' to end this.
list = {}
all_purchases = 0

loop do
  p 'Product name:'
  product = gets.chomp.to_s
  break if product == 'stop'
  p 'Price of goods:'
  price = gets.chomp.to_f
  p 'Quantity of goods:'
  quantity = gets.chomp.to_f
  list[product] = { price: price, quantity: quantity }
end

p list

list.each do |product, value|
  amount = value[:price] * value[:quantity]
  p "Total amount for product #{product} is #{amount} $."
  all_purchases += amount
end

p "Total amount of all purchases: #{all_purchases} $."
