# Описание программы: расчет площади треугольника.
puts "This program calculates the area of the triangle."

# Запрос высоты треугольника.
puts "What is the height of the triangle, in centimeters?"

height = gets.chomp

# Запрос основания треугольника.
puts "What is the length of the base of the triangle, in centimeters?"

base = gets.chomp

# Расчет площади треугольника.
triangle_area = 0.5 * height.to_f * base.to_f

# Вывод расчитанного значения на экран.
puts "The area of the triangle is #{triangle_area} square cm."
