class PolyTreeNode
  attr_accessor :children
  attr_reader :value, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    @parent.children.delete(self) if @parent
    @parent = parent
    parent.children << self if parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child!" unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    return self if @value == target
    @children.each do |child|
      potential_child = child.dfs(target)
      return potential_child if potential_child &&
        potential_child.value == target
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target
      node.children.each{ |child| queue << child}
    end
    nil
  end
end
