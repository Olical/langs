List allAreTypeOf := method(t,
  self reduce(xs, x, xs and x type == t type)
)

List myAverage := method(
  if(self allAreTypeOf(Number) == false, Exception raise("All values must be numbers"))

  sum := self sum
  sum / self size
)

target := list(1, 2, 3, 4, 5)
target myAverage println

"The following code should throw an exception." println

target2 := list(1, 2, false, nil, 5)
target2 myAverage println
