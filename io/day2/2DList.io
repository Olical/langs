2DList := List clone

2DList dim := method(x, y,
  self empty
  self originalX := x
  self originalY := y
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

2DList transpose := method(
  res := 2DList clone
  res dim(self originalY, self originalX)
  for(y, 0, originalY - 1,
    for(x, 0, originalX - 1,
      res set(y, x, self get(x, y))
    )
  )
  res
)

test := 2DList clone
test dim(5, 10)
test set(2, 8, "HI!")
test get(2, 8) println
transposed := test transpose
"test(2, 8) == transposed(8, 2): #{test get(2, 8) == transposed get(8, 2)}" interpolate println
