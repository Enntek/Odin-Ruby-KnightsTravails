# This class creates the game board
class Board
  attr_reader :all_squares
  attr_accessor :one_side

  def initialize
    @one_side = 8
    generate_board
  end

  def generate_board
    @all_squares = []

    one_side.times do |x|
      one_side.times do |y|
        @all_squares.push([x, y])
      end
    end
  end
end