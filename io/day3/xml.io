// I have to take the base XML implementation from the book and add stuff.
// Add indentation.
// Add attributes. If the first argument is a map, use it.
// Need to add curly brace parser for that map too.

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)

Builder := Object clone

Builder indentationSeq := " " repeated(3)

Builder indent := method(n,
  //indentationSeq repeated(n)
  "    " repeated(n)
)

Builder forward := method(
  args := call message arguments
  params := {}
  depth := call message getSlot("depth")
  if(depth == nil, depth = 0)

  if(args first type == "Number", depth = args removeFirst)
  if(args first type == "Map", params = args removeFirst clone)

  writeln(indent(depth), "<", call message name, ">")

  args foreach(arg,
    arg depth := depth + 1
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(indent(depth + 1), content))
  )

  writeln(indent(depth), "</", call message name, ">")
)

Builder ul(
  li("Io",
    ul(
      li("Pretty good."),
      li("Like Lisp.")
    )
  ),
  li("Lua"),
  li("JavaScript",
    ul(
      li("Ewww."),
      li("Sucks in multiple ways."),
      li("Used everywhere any people pay you for it.")
    )
  )
)
