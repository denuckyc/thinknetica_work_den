# Описание программы: решение квадратного уравнения.
puts 'This program solves the quadratic equation'
# Ввидите коэффициенты уравнения.
puts 'Enter the coefficients of the equation.'

puts 'a='
a = gets.chomp.to_f

puts 'b='
b = gets.chomp.to_f

puts 'c='
c = gets.chomp.to_f

# Вычисление дискриминанта.
d = (b**2) - (4 * a * c)

if d < 0
  # Корней нет.
  puts "Discriminant D=(#{d})"
  puts 'There is no roots.'
elsif d == 0
  # Один корень.
  x_1_2 = ((- b) / (2 * a)).round(2)
  puts 'Discriminant D=0'
  puts "Root`s of equation X1=X2=(#{x_1_2})"
else
  d_s = Math.sqrt(d)
  # Два корня.
  x_1 = ((- b + d_s) / (2 * a)).round(2)
  x_2 = ((- b - d_s) / (2 * a)).round(2)
  puts "D=#{d}"
  puts "Root`s of equation X1=(#{x_1}) and X2=(#{x_2})"
end
