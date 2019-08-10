# Введите день месяца, пожалуйста.
puts 'Enter day of month, please.'
day = gets.chomp.to_i
# Введите число месяца, пожалуйста.
puts 'Enter the number of month, please.'
month = gets.chomp.to_i
# Введите год, пожалуйста.
puts 'Enter the year, please.'
year = gets.chomp.to_i

days_in_each_month = {
    '1' => 31,
    '2' => 28,
    '3' => 31,
    '4' => 30,
    '5' => 31,
    '6' => 30,
    '7' => 31,
    '8' => 31,
    '9' => 30,
    '10' => 31,
    '11' => 30,
    '12' => 31,
}

if month == 1
  number_of_day = day
  puts "Date sequence number is #{number_of_day}."
else
  days_in_each_month["2"] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
  days_in_each_month.keep_if { |w, i| w.to_i < month }
  number_of_day = day + days_in_each_month.values.sum
  puts "Date sequence number is #{number_of_day}."
end
