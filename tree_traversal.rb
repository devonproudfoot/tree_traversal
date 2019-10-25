class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def search_depth(value)
    @children.each do |child|
      node = child.search_depth(value)
      return node unless node.nil?
    end
    return self if @payload == value
  end

  def search_breadth(value)
    queue = []
    queue.push(self)

    until queue.empty?
      node = queue.shift

      return node if node.payload == value

      node.children.each do |child|
        queue.push(child)
      end
    end
  end
end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

depth = trunk.search_depth(11)
puts depth.inspect

breadth = trunk.search_breadth(11)
puts breadth.inspect