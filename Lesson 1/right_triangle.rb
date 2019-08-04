# Описание программы: определение типа треугольника.
puts "This program defines the type of triangle."
# Ввидите размер всех трех сторон треугольника.
puts "Enter the size of all three sides of the triangle."

puts "a="
a = gets.chomp

puts "b="
b = gets.chomp

puts "c="
c = gets.chomp

if a.to_f == b.to_f && a.to_f == c.to_f
    # Треугольник равнобедренный и равносторонний.
  puts "This is isosceles and equilateral triangle"
  
    elsif a.to_f > b.to_f && a.to_f > c.to_f && (a.to_f ** 2 == b.to_f ** 2 + c.to_f ** 2) && b.to_f == c.to_f
    # Треугольник прямоугольный и равносторонний.
      puts "This is isosceles right triangle"
    elsif c.to_f > b.to_f && c.to_f > a.to_f && (c.to_f ** 2 == b.to_f ** 2 + a.to_f ** 2) && b.to_f == a.to_f
    # Треугольник прямоугольный и равносторонний.
      puts "This is isosceles right triangle"
    elsif b.to_f > a.to_f && b.to_f > c.to_f && (b.to_f ** 2 == a.to_f ** 2 + c.to_f ** 2) && a.to_f == c.to_f
    # Треугольник прямоугольный и равносторонний.
      puts "This is isosceles right triangle"
      
        elsif a.to_f > b.to_f && a.to_f > c.to_f && (a.to_f ** 2 == b.to_f ** 2 + c.to_f ** 2)
        # Треугольник прямоугольный.
          puts "This is right triangle"
        elsif c.to_f > b.to_f && c.to_f > a.to_f && (c.to_f ** 2 == b.to_f ** 2 + a.to_f ** 2)
        # Треугольник прямоугольный.
          puts "This is right triangle"
        elsif b.to_f > a.to_f && b.to_f > c.to_f && (b.to_f ** 2 == a.to_f ** 2 + c.to_f ** 2)
        # Треугольник прямоугольный.
          puts "This is right triangle"
          
            elsif b.to_f == c.to_f || a.to_f == c.to_f || b.to_f == a.to_f
            # Треугольник равнобедренный.
              puts "This is isosceles triangle"
              
                else
                # Треугольник разносторонний.
                  puts "This is scalene triangle"
end
