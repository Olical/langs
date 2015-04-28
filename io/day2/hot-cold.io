stdin := File standardInput()

"Guess the number between 1 and 100." println

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

ask((Random value(99) + 1) floor(), 10)
