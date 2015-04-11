file_name = ARGV[0]
target = ARGV[1]
line_number = 1

File.open(file_name) do |file|
  file.each_line do |line|
    puts "#{line_number}: #{line}" if line.include?(target)
    line_number += 1
  end
end
