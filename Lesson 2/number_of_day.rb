# Введите день месяца, пожалуйста.
p 'Enter day of month, please.'
day = gets.chomp.to_i
# Введите число месяца, пожалуйста.
p 'Enter the number of month, please.'
month = gets.chomp.to_i
# Введите год, пожалуйста.
p 'Enter the year, please.'
year = gets.chomp.to_i

days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

days[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
number_of_day = days.take(month - 1).sum + day
p "Date sequence number is #{number_of_day}."
