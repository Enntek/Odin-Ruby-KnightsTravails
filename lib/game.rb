class Game
  attr_reader :board, :knight

  def initialize
    @board = Board.new
    @knight = Knight.new
  end

  def piece_moves(piece, current, target)
    build_move_path(piece, current, target)
  end

  # instead of building a tree
  # what if we just iterated through all the legal moves
  # and disallowed moving onto old spaces
  def build_move_path(piece, current, target, path = [], counter = 0)
    # binding.pry

    legal_min_moves = []
    min_moves = piece.move_pattern
    min_moves.each do |move|
      spot = [current[0] + move[0], current[1] + move[1]]
      legal_min_moves.push spot if legal?(spot) && !path.include?(spot)
    end

    path.push current

    if current == target
      p 'match found!' 
      return p path
    end
    return p path if counter == 2
    return p path if legal_min_moves.empty?

    counter += 1

    # p legal_min_moves

    legal_min_moves.each do |move|
      build_move_path(piece, move, target, path, counter)
      # next_move = legal_min_moves.pop
    end

    # must return array of path taken
  end

  def legal?(move)
    move.all? { |x| x >= 0 }
  end
end

# start with knight at current space [0, 0]
# set target for [1, 2]
# recursive method will move all legal spaces 1
# if current = target, return path


class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end
  def default;        "\e[39m#{self}\e[0m" end

  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end

  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end
