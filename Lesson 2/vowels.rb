# A, E, I, O, U, sometimes Y
a = Hash[("a".."z").to_a.zip((1..26).to_a)]
c = Hash.new
c = a.select { |k, v| k =~ /[aeiouy]/ }
puts c
