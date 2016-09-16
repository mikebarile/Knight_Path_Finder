require_relative 'polytree'

class KnightPathFinder
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
    @start_pos = pos
    @visited_pos = [@start_pos]
    @move_tree = build_move_tree
  end

  def find_path(target_pos)

  end

  def build_move_tree

  end

  def new_move_positions

  end

  def self.valid_moves(pos)

  end
end
