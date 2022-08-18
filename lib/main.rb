require_relative 'game'
require_relative 'board'
require_relative 'knight'
require_relative 'node'
require 'pry-byebug'

game = Game.new

game.knight_moves([0, 0], [2, 1])
