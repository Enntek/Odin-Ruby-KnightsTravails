# This class creates the game board
class Board
  attr_reader :all_spaces

  def initialize
    generate_board
  end

  def generate_board
    @all_spaces = []

    8.times do |x|
      8.times do |y|
        @all_spaces.push([x, y])
      end
    end
  end



end

# include list of spaces traversed, no double backing, only moving forward

# legal moves are add 1 or subtract 1, add 2 or subtract 2
# [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
# tree is legal moves expanded out, i think
# legal moves: [4, 5], [5, 4], [5, 2], [4, 1], [2, 1], [1, 2], [1, 4], [2, 5]


