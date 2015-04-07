def walk_classes(n)
  puts n.class
  n = n.class

  while n.superclass do
    puts n.superclass
    n = n.superclass
  end
end

puts "Hash classes..."
walk_classes({:foo => 5})

puts "\nNumber classes..."
walk_classes(5)
