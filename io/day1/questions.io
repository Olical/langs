# Can not use 1 + "one", it is strongly typed.
# It throws an exception.
(1 + 1) println

# Truthy or falsy?
check := method(value,
  if(value,
    "#{value} is truthy",
    "#{value} is falsy"
  ) interpolate println
)

check(0)
check(1)
check("")
check(nil)

# Slots?
Number slotNames println

# Assignment?
foo := Object clone
foo name ::= "Oliver"
foo name println
foo setName("OC")
foo name println
