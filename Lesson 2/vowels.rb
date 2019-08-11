# A, E, I, O, U, sometimes Y
a = Hash[("a".."z").zip(1..26).to_h]
c = a.select { |k| k =~ /[aeiouy]/ }
p c
