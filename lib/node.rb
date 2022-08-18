# This class creates nodes for trees and graphs
class Node

  attr_reader :data, :parent
  attr_accessor :next_valid_moves

  def initialize(data, parent = nil)
    @data = data
    @next_valid_moves = []
    @parent = parent
  end

  def add_edge(next_move)
    @next_valid_moves.push next_move
  end

  def visited_nodes(node = self, visited_list = [])
    return visited_list if node.nil?

    visited_list.unshift node.data
    visited_nodes(node.parent, visited_list)
  end

end