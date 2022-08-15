# This class creates the knight chess piece
class Knight
  def initialize
    # home spot, for later on
  end

  def move_pattern
    [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

  def show
    '♞'
  end
end