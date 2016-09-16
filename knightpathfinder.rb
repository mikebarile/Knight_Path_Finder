require_relative 'polytree'
require 'byebug'

class KnightPathFinder
  attr_reader :move_tree, :visited_pos
  POTENTIAL_MOVES = [
    [2,-1],
    [2,1],
    [1,-2],
    [1,2],
    [-1,-2],
    [-1,2],
    [-2,-1],
    [-2,1]
  ]

  def initialize(start_pos)
    @visited_pos = [start_pos]
    build_move_tree
  end

  def find_path(target_pos)
    target = @root.bfs(target_pos)
    trace_path_back(target).reverse
  end

  def trace_path_back(target)
    return nil unless target
    path = [target.value]
    path += trace_path_back(target.parent) if target.parent
    path
  end

  def build_move_tree
    @root = Node.new(@visited_pos[0])
    queue = [@root]
    until queue.empty?
      node = queue.shift
      positions = new_move_positions!(node.value)
      positions.each do |pos|
        next_node = Node.new(pos)
        node.add_child(next_node)
        queue << next_node
      end
    end
  end

  def new_move_positions!(pos)
    new_moves = valid_moves(pos)
    @visited_pos += new_moves if new_moves
    return new_moves
  end

  def valid_moves(pos)
    row = pos[0]
    col = pos[1]
    moves = potential_positions(pos)
    moves.select! do |position|
      in_bounds?(position) && !@visited_pos.include?(position)
    end
    moves
  end

  def potential_positions(pos)
    row = pos[0]
    col = pos[1]
    potential_positions = POTENTIAL_MOVES.map do |move|
      [row + move[0], col + move[1]]
    end
    potential_positions
  end

  def in_bounds?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <= 7
  end
end

a = KnightPathFinder.new([0,0])
p a.find_path([6,2])
