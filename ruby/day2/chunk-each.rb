def puts_chunk(arr, n)
  index = 1

  arr.each() do |i|
    print i
    mod = index.modulo(n)
    print ' ' if mod != 0
    print "\n" if mod == 0
    index += 1
  end
end

puts_chunk((1..16).to_a, 4)
