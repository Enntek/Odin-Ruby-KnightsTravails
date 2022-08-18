require 'pry-byebug'

#    Minimum number of edges between two vertices of a Graph
class AjlistNode 
  # Define the accessor and reader of class AjlistNode
  # attr_reader :id, :next
  attr_accessor :id, :next

  #  Vertices node key
  def initialize(id) 
    #  Set value of node key
    self.id = id
    self.next = nil
  end

end

class Vertices 
  # Define the accessor and reader of class Vertices
  # attr_reader :data, :next, :last
  attr_accessor :data, :next, :last

  def initialize(data) 
    self.data = data
    self.next = nil
    self.last = nil
  end

end

class Graph 
  # Define the accessor and reader of class Graph
  # attr_reader :size, :result, :node
  attr_accessor :size, :result, :node

  #  Number of Vertices
  def initialize(size) 
    #  Set value
    self.size = size
    self.result = 0
    self.node = Array.new(size) {nil}
    self.setData()
  end

  #  Set initial node value
  def setData() 
    if (self.size <= 0) 
      print("\nEmpty Graph\n")
    else
 
      index = 0
      while (index < self.size) 
        #  Set initial node value
        self.node[index] = Vertices.new(index)
        index += 1
      end

    end

  end

  def connection(start, last) 
    #  Safe connection
    edge = AjlistNode.new(last)
    if (self.node[start].next == nil) 
      self.node[start].next = edge
    else
 
      #  Add edge at the end
      self.node[start].last.next = edge
    end

    #  Get last edge 
    self.node[start].last = edge
  end

  #   Handling the request of adding new edge
  def addEdge(start, last) 
    if (start >= 0 && start < self.size && 
            last >= 0 && last < self.size) 
      self.connection(start, last)
    else
 
      #  When invalid nodes
      print("\nHere Something Wrong\n")
    end

  end

  def printGraph() 
    if (self.size > 0) 
      index = 0
      #  Print graph ajlist Node value
      while (index < self.size) 
        print("\nAdjacency list of vertex ", index ," :")
        edge = self.node[index].next
        while (edge != nil) 
          #  Display graph node 
          print("  ", self.node[edge.id].data)
          #  Visit to next edge
          edge = edge.next
        end

        index += 1
      end

    end

  end

  def findMinimumEdge(start, last, visit, length) 
    if (start >= self.size || last >= self.size || 
            start < 0 || last < 0 || self.size <= 0) 
      return
    end

    if (visit[start] == true) 
      return
    end

    #  Here length are indicate number of edge
    if (start == last && length < self.result) 
      #  When new result
      self.result = length
    end

    #  Here modified the value of visited node
    visit[start] = true
    #  This is used to iterate nodes edges
    edge = self.node[start].next
    while (edge != nil) 
      self.findMinimumEdge(edge.id, last, visit, length + 1)
      #  Visit to next edge
      edge = edge.next
    end

    #  Reset the value of visited node status
    visit[start] = false
  end

  def minEdges(u, v) 
    if (self.size <= 0) 
      #  Empty graph
      return
    end

    #  Auxiliary space which is used to store 
    #  information about visited node.
    #  Set initial visited node status false
    visit = Array.new(self.size) {false}
    self.result = (2 ** (0. size * 8 - 2))
    #  Count edge between u to v
    self.findMinimumEdge(u, v, visit, 0)
    #  Display result
    print("\nMinimum edges in between [", 
              u ,",", v ,"] is ", self.result, "\n")
  end

end

def main() 
  binding.pry

  g = Graph.new(2) # num of nodes in graph

  #  Connect node with an edge
  #  First and second parameter indicate node
  # 7_node_undirected_graph.png
  # g.addEdge(0, 1)
  # g.addEdge(0, 2)
  # g.addEdge(0, 4)
  # g.addEdge(1, 0)
  # g.addEdge(1, 2)
  # g.addEdge(2, 0)
  # g.addEdge(2, 1)
  # g.addEdge(2, 5)
  # g.addEdge(3, 4)
  # g.addEdge(4, 0)
  # g.addEdge(4, 3)
  # g.addEdge(4, 5)
  # g.addEdge(4, 6)
  # g.addEdge(5, 2)
  # g.addEdge(5, 4)
  # g.addEdge(6, 4)

  # simple 2 node connection
  g.addEdge(0, 1)
  # g.addEdge(6, 4)

  #  Print graph element
  # g.printGraph()

  g.minEdges(0, 1)
end

main()
