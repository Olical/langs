Multilist := List clone

Multilist dim := method(x, y,
  self empty
  for(iy, 0, y - 1,
    self push(List clone)
    self at(iy) setSize(x)
  )
)

Multilist set := method(x, y, value,
  self at(y) atInsert(x, value)
)

Multilist get := method(x, y,
  self at(y) at(x)
)

test := Multilist clone
test dim(5, 10)
test set(2, 8, "HI!")
test get(2, 8) println
