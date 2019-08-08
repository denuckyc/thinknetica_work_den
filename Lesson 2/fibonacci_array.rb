array = Array.new(2) { |f| f }

while array[-1] + array[-2] < 100
  f = array[-1] + array[-2]
  array.push(f)
end
# Вывод заполненного массива.
print array
puts ''
