# Приветствие.
puts "Hello stranger! Tell me your name, please."

# Запрос имени у пользователя.
name = gets.chomp

puts "And now, tell me your height, in centimeters please."

# Запрос роста пользователя в см.
weigth = gets.chomp

# Подсчет идеального веса.
ideal_weight = weigth.to_f - 110

if ideal_weight < 0
  # Выводит сообщение, что вес уже оптимальный.
  puts "#{name}, You have optimal weight."
    else
      # Выводит сообщение с идельным весом пользователя.
      puts "#{name}, Your ideal weight is #{ideal_weight} kg."
end
