2DList := List clone

2DList dim := method(x, y,
  self empty
  for(iy, 0, y - 1,
    self push(List clone)
    self at(iy) setSize(x)
  )
)

2DList set := method(x, y, value,
  self at(y) atInsert(x, value)
)

2DList get := method(x, y,
  self at(y) at(x)
)

test := 2DList clone
test dim(5, 10)
test set(2, 8, "HI!")
test get(2, 8) println
