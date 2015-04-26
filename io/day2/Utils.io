Utils := Object clone

Utils isList := method(n, n type == List type)

Utils reduce := method(fn, initial, vals,
  accum := initial
  vals foreach(i, val, accum = fn(val, accum))
  accum
)
