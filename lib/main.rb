# https://www.theodinproject.com/lessons/ruby-knights-travails
# frozen_string_literal: true

require_relative 'game'
require_relative 'board'
require_relative 'knight'
require_relative 'node'
require 'pry-byebug'

game = Game.new
game.board.width = 8
max_index = game.board.width - 1 # if size of board is 8x8, size is 7

home = [3, 3]
target = [4, 3] # use max_index here to find path from corner to corner
game.knight_moves(home, target)

