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
    @visited_pos = [Node.new(start_pos)]
    build_move_tree
  end

  def find_path(target_pos)
    
  end

  def build_move_tree
    queue = @visited_pos
    until queue.empty?
      node = queue.shift
      queue += new_move_positions!(node)
    end
  end

  def new_move_positions!(node)
    new_moves = KnightPathFinder.valid_moves(node)
    new_moves.select! do |move|
      !@visited_pos.map(&:value).include?(move.value)
    end
    @visited_pos += new_moves if new_moves
    return new_moves
  end

  def self.valid_moves(node)
    row, col = node.value
    valid_moves = []
    POTENTIAL_MOVES.each do |move|
      row += move[0]
      col += move[1]
      if row >= 0 && row <= 7 && col >= 0 && col <= 7
        valid_moves << Node.new([row,col])
        node.add_child(valid_moves[-1])
      end
      row, col = node.value
    end
    valid_moves
  end
end

a = KnightPathFinder.new([0,0])
p a.visited_pos.map(&:value)
