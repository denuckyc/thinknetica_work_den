# Описание программы: определение типа треугольника.
puts 'This program defines the type of triangle.'
# Введите размер всех трех сторон треугольника.
puts 'Enter the size of all three sides of the triangle.'

puts 'a='
a = gets.chomp.to_f

puts 'b='
b = gets.chomp.to_f

puts 'c='
c = gets.chomp.to_f

# Максимальная длина.
h = [a, b, c].max

# Две минимальные длины.
k_1, k_2 = [a, b, c].min(2)

if h**2 == k_1**2 + k_2**2
  # Треугольник прямоугольный.
  puts 'This is right triangle'
elsif  a == b && a == c
  # Треугольник равнобедренный и равносторонний.
  puts 'This is isosceles and equilateral triangle'
elsif b == c || a == c || b == a
  # Треугольник равнобедренный.
  puts 'This is isosceles triangle'
else
  # Треугольник разносторонний.
  puts 'This is scalene triangle'
end
