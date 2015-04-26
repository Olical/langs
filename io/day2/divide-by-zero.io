originalDiv := Number getSlot("/")
Number / := method(denom,
  if(denom == 0, denom, self originalDiv(denom))
)

(10 / 2) println
(10 / 0) println
