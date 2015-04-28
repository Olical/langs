Multilist := List clone

Multilist dim := method(x, y,
  self empty
  self originalX := x
  self originalY := y
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

Multilist transpose := method(
  res := Multilist clone
  res dim(self originalY, self originalX)
  for(y, 0, originalY - 1,
    for(x, 0, originalX - 1,
      res set(y, x, self get(x, y))
    )
  )
  res
)

test := Multilist clone
test dim(5, 10)
test set(2, 8, "HI!")
test get(2, 8) println
transposed := test transpose
"test(2, 8) == transposed(8, 2): #{test get(2, 8) == transposed get(8, 2)}" interpolate println

f := File with("mlist.out")
f remove
f openForUpdating
f write(test serialized)
f close

test := Multilist clone
test empty
test union(doFile("mlist.out"))
test get(2, 8) println
