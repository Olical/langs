// I have to take the base XML implementation from the book and add stuff.
// Add indentation.
// Add attributes. If the first argument is a map, use it.
// Need to add curly brace parser for that map too.

Builder := Object clone
Builder forward := method(
  writeln("<", call message name, ">")
  call message arguments foreach(arg,
    content := self doMessage(arg)
    if(content type == "Sequence", writeln(content))
    writeln("</", call message name, ">")
  )
)

Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript")
)
