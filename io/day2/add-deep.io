reduce := method(fn, initial, vals,
  accum := initial
  vals foreach(i, val, accum = fn(val, accum))
  accum
)

isList := method(n, n type == List type)

adder := method(a, b, if(isList(a), addDeep(a) + b, a + b))
addDeep := method(numbers, reduce(Object getSlot("adder"), 0, numbers))

addDeep(list(1, list(5, 10, list(3, 5)), 3)) println
