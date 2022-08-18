# This class creates nodes for trees and graphs
class Node
  attr_reader :data
  attr_accessor :parent

  def initialize(data, parent = nil)
    @data = data
    @parent = parent
  end

  def visited_squares(node = self, visited_squares = [])
    return visited_squares if node.nil?

    visited_squares.unshift(node.data)
    visited_squares(node.parent, visited_squares)
  end
end
