print "Hello, guess the number between 1 and 10. I'll tell you if you're too low or high.\n"

answer = rand(10) + 1
guess = nil

while guess != answer
  print "Guess: "
  guess = gets().to_i

  print "Higher!\n" if guess < answer
  print "Lower!\n" if guess > answer
end

print "Yep! It was #{answer}. Nice one.\n"
