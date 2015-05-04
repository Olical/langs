def strslen(strs: List[String]): Int = {
  (0 /: strs) {
    (sum, i) => sum + i.length
  }
}

println(strslen(List(
  "Hello",
  "World!"
)))
