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
    row, col = pos
    valid_moves = []
    POTENTIAL_MOVES.each do |move|
      row += move[0]
      col += move[1]
      valid_moves << [row,col] if row >= 0 && row <= 7 &&
        col >= 0 && col <= 7
      row, col = pos
    end
    valid_moves
  end
end
