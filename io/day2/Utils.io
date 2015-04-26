Utils := Object clone

Utils adder := method(a, b, if(Utils isList(a), addDeep(a) + b, a + b))

Utils isList := method(n, n type == List type)

Utils reduce := method(fn, initial, vals,
  accum := initial
  vals foreach(i, val, accum = fn(val, accum))
  accum
)
