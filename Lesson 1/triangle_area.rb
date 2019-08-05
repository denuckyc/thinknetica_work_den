# Описание программы: расчет площади треугольника.
puts 'This program calculates the area of the triangle.'

# Запрос высоты треугольника.
puts 'What is the height of the triangle, in centimeters?'

height = gets.chomp.to_f

# Запрос основания треугольника.
puts 'What is the length of the base of the triangle, in centimeters?'

base = gets.chomp.to_f

# Расчет площади треугольника.
triangle_area = 0.5 * height * base

# Вывод расчитанного значения на экран.
puts 'The area of the triangle is #{triangle_area} square cm.'
