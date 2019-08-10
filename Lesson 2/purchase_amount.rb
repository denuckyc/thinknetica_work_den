# Enter 'stop' to end this.
list = Hash.new
all_purchases = 0

loop do
  puts 'Product name:'
  product = gets.chomp.to_s
  break if product == 'stop'
  puts 'Amount of goods:'
  price = gets.chomp.to_f
  puts 'Quantity of goods:'
  quantity = gets.chomp.to_f
  amount = Hash.new
  amount[price] = quantity
  list[product] = amount
end

puts list

list.each do |product, amount|
  amount.each do |price, quantity|
    amount = price * quantity
    puts "Total amount for product #{product} is #{amount} $."
    all_purchases += amount
  end
end

puts "Total amount of all purchases: #{all_purchases} $."
