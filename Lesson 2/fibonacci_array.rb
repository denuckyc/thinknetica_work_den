array = Array.new(2) { |f| f }

while (f = array[-1] + array[-2]) < 100
  array.push(f)
end
# Вывод заполненного массива.
p array
