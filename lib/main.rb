require_relative 'game'
require_relative 'board'
require_relative 'knight'
require 'pry-byebug'

game = Game.new

game.piece_moves(game.knight, [0, 0], [2, 1])


# p game.board.all_spaces

# arr = board.legal_moves(k)

# k1 = Knight.new
# puts " ♞ ".bg_red
# str = ''
# str2 = ''
# 4.times { str += "#{' ♞ '.bg_red}#{' ♘ '.bg_gray}" }
# 4.times { str2 += "#{'   '.bg_gray}#{'   '.bg_red}" }
# 4.times { puts str + "\n" + str2 }

