# This class creates the game board
class Board
  attr_reader :all_squares
  attr_accessor :width

  def initialize
    @width = 8
    generate_board
  end

  def generate_board
    @all_squares = []

    width.times do |x|
      width.times do |y|
        @all_squares.push([x, y])
      end
    end
  end
end

board = Board.new

p board.all_squares