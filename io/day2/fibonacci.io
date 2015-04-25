recursiveFibonacci := method(n, a, b,
  a := if(a, a, 0)
  b := if(b, b, 1)
  next := a + b
  if(n == 0, a, recursiveFibonacci(n - 1, b, next))
)

runStrategies := method(n,
  "Recursive: #{recursiveFibonacci(n)}" interpolate println
)

n := System args at(1) asNumber
if(n type == Number,
  "Please provide a number to calculate the nth Fibonacci number against." println,
  runStrategies(n)
)
