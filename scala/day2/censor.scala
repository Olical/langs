trait Censor {
  val censoredWords = readCensors("censors.txt")

  def readCensors(path: String): Map[String,String] = {
    val censors = io.Source.fromFile(path).mkString
    censors.split("\n").map(_.split(" ")).map(n => (n(0), n(1))).toMap
  }

  def censor(dirty: String): String = {
    dirty.split(" ").map(word => censoredWords.getOrElse(word, word)).mkString(" ")
  }
}

class Bleeper extends Censor {}

val bleep = new Bleeper
val msg = "yes it's not perfect but darn it works well, oh shoot puctualtion ruins it though"
println(bleep.censor(msg))
