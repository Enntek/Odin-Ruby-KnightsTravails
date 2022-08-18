class Game
  attr_reader :board, :knight, :root

  def initialize
    @board = Board.new
    @knight = Knight.new
  end
  
  def knight_moves(current, target)
    @root = Node.new(current)
    build_tree(@root)
  end

  def build_tree(node)

    square = node.data

    legal_next_moves = knight.move_pattern.map do |pattern|
      next_move = [square[0] + pattern[0], square[1] + pattern[1]]
      if legal?(next_move) && new_square?(next_move, node.visited_nodes)
        next_move
      else
        nil
      end
    end

    legal_next_moves.each do |next_move|
      if !next_move.nil?
        new_node = Node.new(next_move, node) # 
        node.add_edge(new_node) 
      end
    end

    puts "\ncurrent square"
    p square
    puts 'visited nodes'
    p node.visited_nodes
    # node.next_valid_moves.each do |adjacent_node|
    #   p adjacent_node.data
    # end

    node.next_valid_moves.each do |adjacent_node|
      build_tree(adjacent_node)
    end
  end

  def legal?(next_move)
    @board.all_squares.any? { |square| square == next_move }
  end
  
  def new_square?(next_move, visited_squares)
    visited_squares.none? { |visited_square| next_move == visited_square}
  end
end

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
