# This class creates the game board
class Board
  attr_reader :all_squares

  def initialize
    generate_board
  end

  def generate_board
    @all_squares = []

    8.times do |x|
      8.times do |y|
        @all_squares.push([x, y])
      end
    end
  end
end