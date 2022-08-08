class GraphNode

    attr_accessor :val, :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    # Graph = Agency List

    #graph = {
    #    'a': ['b', 'c', 'e'],
    #    'b': [],
    #    'c': ['b', 'd'],
    #    'd': [],
    #    'e': ['a'],
    #    'f': ['e']
    #  }

    def depth_first(graph)
        visited = Set.new()
        graph.keys.each do |node|
            _depth_first(node, graph, visited)
        end
    end

    def _depth_first(node, graph, visited)
        return nil if visited.include?(node.to_sym)

        puts node
        visited.add(node.to_sym)

        graph[node.to_sym].each do |neighbor|
            _depth_first(neighbor, graph, visited)
        end
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

