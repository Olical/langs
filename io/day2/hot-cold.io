// Just an intro message.
"Guess the number between 1 and 100." println

// File handler to read from the command line.
stdin := File standardInput()


// The main recursive function will keep prompting for input and printing the
// status until the user is out of guesses or we have a solution.
ask := method(answer, remainingAttempts, previousGuess,
  "> " print
  guess := stdin readLine() asNumber()

  if(answer == guess,
    "Yep! It was #{answer}, well done." interpolate println,
    "Nope, it's not #{guess}." interpolate println
    if(remainingAttempts > 0,
      getStatus(remainingAttempts, answer, guess, previousGuess) println
      ask(answer, remainingAttempts - 1, guess),
      "You're out of attempts, better luck next time!" println
    )
  )
)

// This is used to build the "warmer" or "colder" messages for the user. It'll
// also let them know how many attempts they have left.
getStatus := method(remainingAttempts, answer, guess, previousGuess,
  result := list()

  if(previousGuess != nil,
    delta := (answer - guess) abs()
    previousDelta := (answer - previousGuess) abs()

    if(delta < previousDelta, result push("Getting warmer."))
    if(delta > previousDelta, result push("Getting colder."))
  )

  result push("You have #{remainingAttempts} attempts remaining." interpolate)

  result join("\n")
)

// We kick off the recursive asker with a random value and an amount of guesses
// they will have. 9 actually corresponds to 10 since the remaining guesses
// counter is only decremented upon recursion. If you provided a guess limit of
// 0 they would have one attempt. It's more like an "extra guesses" limit.
ask((Random value(99) + 1) floor(), 9)
