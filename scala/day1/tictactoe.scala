class Board(val board: List[Char]) {
  val width = 3

  def rows(): List[List[Char]] = {
    board.grouped(width).toList
  }

  def columns(): List[List[Char]] = {
    board.groupBy(_._1 % width).values.toList
  }

  def announce() {
    println("shrug")
  }

  def get(x: Int, y: Int) = board(width * y + x)
}

println("No winner?")
new Board(List(
  '_', '_', '_',
  '_', '_', '_',
  '_', '_', '_'
)).announce
println

println("X wins?")
new Board(List(
  '_', 'X', '_',
  '_', 'X', '_',
  '_', 'X', '_'
)).announce
println

println("O wins?")
new Board(List(
  'O', '_', '_',
  '_', 'O', '_',
  '_', '_', 'O'
)).announce
println

println("Still playing?")
new Board(List(
  'X', '_', '_',
  '_', '_', '_',
  '_', '_', 'O'
)).announce
println

println("Draw?")
val game = new Board(List(
  'X', 'X', 'O',
  'O', 'X', 'X',
  'X', 'O', 'O'
))
game.announce
println(game.columns)
