class Board(val board: List[Char]) {
  val size = 3
  val indexes = List.range(0, 3)

  def rows(): List[List[Char]] = {
    board.grouped(size).toList
  }

  def columns(): List[List[Char]] = {
    for { x <- indexes } yield {
      for { y <- indexes } yield { get(x, y) }
    }
  }

  // I know this one could probably be better.
  // My knowledge of for comprehensions is rusty.
  def diagonals(): List[List[Char]] = {
    List(
      for {
        xy <- indexes
      } yield {
        get(xy, xy)
      },
      for {
        xy <- indexes
      } yield {
        get((size - 1) - xy, xy)
      }
    )
  }

  def lines(): List[List[Char]] = {
    // Probably could have just used a good for.
    // All x the same, all y the same and all xy the same / inverse for other diagonal.
    // Yeah, pretty sure there's a really elegant way to get these lines.
    // Just wanted to play with the language so it's verbose.
    // YOU'RE NOT MY SUPERVISOR.
    rows ++ columns ++ diagonals
  }

  def makeLine(n: Char): List[Char] = {
    List.fill(size)(n)
  }

  def announce() {
    // No winner: Still blank places. (_)
    // X / O wins if there's a line.
    // Draw if all are full and there's no line.
    val lines = this.lines
    val xLine = makeLine('X')
    val oLine = makeLine('O')
    val hasBlanks = lines.flatten.find(_ == '_').isEmpty == false

    if (lines.find(_.sameElements(xLine)).isEmpty == false) {
      println("X wins!")
    }
    else if (lines.find(_.sameElements(oLine)).isEmpty == false) {
      println("O wins!")
    }
    else if (hasBlanks) {
      println("Still playing!")
    }
    else if (!hasBlanks) {
      println("It's a draw!")
    }
  }

  def get(x: Int, y: Int) = board(size * y + x)
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
