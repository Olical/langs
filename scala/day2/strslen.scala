def strslen(strs: List[String]): Int = {
  strs.map(_.length).foldLeft(0)((a, b) => a + b)
}

println(strslen(List(
  "Hello",
  "World!"
)))
