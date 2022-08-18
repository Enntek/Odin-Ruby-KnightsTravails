require_relative 'game'
require_relative 'board'
require_relative 'knight'
require_relative 'node'
require 'pry-byebug'

game = Game.new
game.board.one_side = 8
max_index = game.board.one_side - 1 # if size of board is 8x8, size is 7

home = [3, 3]
target = [4, 3] # use max_index here to find path from corner to corner
game.knight_moves(home, target)

