# Описание программы: решение квадратного уравнения.
puts "This program solves the quadratic equation."
# Ввидите коэффициенты уравнения.
puts "Enter the coefficients of the equation."

puts "a="
a = gets.chomp

puts "b="
b = gets.chomp

puts "c="
c = gets.chomp

# Вычисление дискриминанта.
d = (b.to_f ** 2) - (4 * a.to_f * c.to_f)

# Вычисление корней уравнения.
x_1 = (- b.to_f + Math.sqrt(d.abs)) / (2 * a.to_f)

x_2 = (- b.to_f + Math.sqrt(d.abs)) / (2 * a.to_f)

if d < 0
  # Корней нет.
  puts "D=(#{d})"
  puts "There is no roots"
  
    elsif d == 0
      # Один корень.
      puts "D=#{d.to_i}"
      puts "Root`s of equation X1=X2=(#{x_2})"
    
      else
        # Два корня.
        puts "D=#{d}"
        puts "Root`s of equation X1=(#{x_1}) and X2=(#{x_2})"
        
end
