# This class creates nodes for trees and graphs
class Node
  attr_reader :data
  attr_accessor :parent

  def initialize(data, parent = nil)
    @data = data
    @parent = parent
  end

  def visited_list(node = self, visited_list = [])
    return visited_list if node.nil?

    visited_list.unshift(node.data)
    visited_list(node.parent, visited_list)
  end
end
