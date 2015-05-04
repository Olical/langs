trait Censor {
  val censoredWords = Map(
    "shoot" -> "pucky",
    "darn" -> "beans"
  )

  def censor(dirty: String): String = {
    dirty.split(" ").map(word => censoredWords.getOrElse(word, word)).mkString(" ")
  }
}

class Bleeper extends Censor {}

val bleep = new Bleeper
val msg = "yes it's not perfect but darn it works well, oh shoot puctualtion ruins it though"
println(bleep.censor(msg))
