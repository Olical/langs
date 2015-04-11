def puts_chunk(arr, n)
  arr.each_slice(n) do |i|
    puts i.join(' ')
  end
end

puts_chunk((1..16).to_a, 4)
