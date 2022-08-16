# This class creates the knight chess piece
class Knight
  def initialize
    # home spot, for later on
  end

  def shortest_moves
    [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

  def show
    '♞'
  end
end