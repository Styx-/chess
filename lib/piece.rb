# Piece class defines a piece in general
class Piece
  attr_accessor :location
  attr_reader :color, :piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @reach = 1
    @possible_directions = [:north, :south, :east, :west,
                            :northeast, :northwest, :southeast, :southwest]
    @piece = ''
  end

  def eql?(other)
    (self.class == other.class) && (@color == other.piece_color)
  end

  def ==(other)
    self.eql?(other)
  end

  # Calculates possible moves based on possible_directions and reach
  def possible_moves
    moves = []
    @reach.downto(-@reach) {|num| moves << num}
    moves = moves.repeated_permutation(2).to_a
    moves = apply_directions(moves)
    moves = apply_location(moves)
    moves = apply_board_limits(moves)
  end

  def apply_board_limits(moves)
    moves.delete_if do |move|
      move[0] < 0 ||
      move[0] > 7 ||
      move[1] < 0 ||
      move[1] > 7
    end
  end

  # Applies location to possible moves
  def apply_location(moves)
    moves.delete([0,0])
    moves.map { |move| [(move[0] + @location[0]), (move[1] + @location[1])]}
  end

  # Filters possible moves with possible_directions
  def apply_directions(moves)
    moves.delete_if do |move|
      ((move[0] * -1) != move[1]) && (not cardinal_move?(move)) && (move[0] != move[1])
    end
    moves.delete_if { |move| northern_move?(move) } unless can_move_north?
    moves.delete_if { |move| southern_move?(move) } unless can_move_south?
    moves.delete_if { |move| eastern_move?(move) } unless can_move_east?
    moves.delete_if { |move| western_move?(move) } unless can_move_west?
    moves.delete_if { |move| northeastern_move?(move) } unless can_move_northeast?
    moves.delete_if { |move| northwestern_move?(move) } unless can_move_northwest?
    moves.delete_if { |move| southeastern_move?(move) } unless can_move_southeast?
    moves.delete_if { |move| southwestern_move?(move) } unless can_move_southwest?
    moves
  end

  def cardinal_move?(move)
    northern_move?(move) || southern_move?(move) || western_move?(move) || eastern_move?(move)
  end

  def northern_move?(move)
    move[0] >= 1 && move[1] == 0
  end

  def southern_move?(move)
    move[0] <= -1 && move[1] == 0
  end

  def eastern_move?(move)
    move[1] >= 1 && move[0] == 0
  end

  def western_move?(move)
    move[1] <= -1 && move[0] == 0
  end

  def northeastern_move?(move)
    move[0] >= 1 && move[1] >= 1
  end

  def northwestern_move?(move)
    move[0] >= 1 && move[1] <= -1
  end

  def southeastern_move?(move)
    move[0] <= -1 && move[1] >= 1
  end

  def southwestern_move?(move)
    move[0] <= -1 && move[1] <= -1
  end

  def can_move_north?
    @possible_directions.include?(:north)
  end

  def can_move_south?
    @possible_directions.include?(:south)
  end

  def can_move_east?
    @possible_directions.include?(:east)
  end

  def can_move_west?
    @possible_directions.include?(:east)
  end

  def can_move_northeast?
    @possible_directions.include?(:northeast)
  end

  def can_move_northwest?
    @possible_directions.include?(:northwest)
  end

  def can_move_southeast?
    @possible_directions.include?(:southeast)
  end

  def can_move_southwest?
    @possible_directions.include?(:southwest)
  end
end

# Pawn Class inherits Piece Class
class Pawn < Piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @reach = 1
    @possible_directions = [:north]
    @piece = "\u265f"
  end
end

# Knight Class inherits Piece Class
class Knight < Piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @piece = "\u265e"
  end

# Knight's movements are different from other pieces
  def possible_moves
    moves = [[-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1]]
    apply_location(moves)
  end
end

# Bishop Class inherits Piece Class
class Bishop < Piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @reach = 7
    @possible_directions = [:northeast, :northwest,
                            :southeast, :southwest]
    @piece = "\u265d"
  end
end

# Rook Class inherits Piece Class
class Rook < Piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @reach = 7
    @possible_directions = [:north, :south, :east, :west]
    @piece = "\u265c"
  end
end

# Queen Class inherits Piece Class
class Queen < Piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @reach = 7
    @possible_directions = [:north, :south, :east, :west,
                            :northeast, :northwest, :southeast, :southwest]
    @piece = "\u265b"
  end
end

# King Class inherits Piece Class
class King < Piece
  def initialize(location = [0, 0], color = :black)
    @location = location
    @color = color
    @reach = 1
    @possible_directions = [:north, :south, :east, :west,
                            :northeast, :northwest, :southeast, :southwest]
    @piece = "\u265a"
  end
end
