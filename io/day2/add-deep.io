adder := method(a, b, if(Utils isList(a), addDeep(a) + b, a + b))
addDeep := method(numbers, Utils reduce(Object getSlot("adder"), 0, numbers))

addDeep(list(1, list(5, 10, list(3, 5)), 3)) println
