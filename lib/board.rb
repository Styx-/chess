require 'colored'

class Board
  #attr_reader :board
  attr_accessor :board
  def initialize(board = empty_board)
    @board = board
    set_board
  end

  def empty_board
    Array.new(8) { Array.new(8) }
  end

  def display_board
    puts '  0  1  2  3  4  5  6  7'
    7.downto(0) do |line|
      print line
      display_even_line(line) if line.even?
      display_odd_line(line) if line.odd?
    end
  end

  def piece_at(row, column)
    @board[row][column]
  end

  def display_even_line(line)
    0.upto(7) do |cell|
      if @board[line][cell].nil?
        print "   ".black_on_blue if cell.even?
        print "   ".black_on_green if cell.odd?
      else
        if @board[line][cell].color == :black
          print " #{@board[line][cell].piece} ".black_on_blue if cell.even?
          print " #{@board[line][cell].piece} ".black_on_green if cell.odd?
         else
          print " #{@board[line][cell].piece} ".white_on_blue if cell.even?
          print " #{@board[line][cell].piece} ".white_on_green if cell.odd?
        end
      end
    end
    print "\n"
  end

  def display_odd_line(line)
    0.upto(7) do |cell|
      if @board[line][cell].nil?
          print "   ".black_on_green if cell.even?
          print "   ".black_on_blue if cell.odd?
      else
        if @board[line][cell].color == :black
          print " #{@board[line][cell].piece} ".black_on_green if cell.even?
          print " #{@board[line][cell].piece} ".black_on_blue if cell.odd?
        else
          print " #{@board[line][cell].piece} ".white_on_green if cell.even?
          print " #{@board[line][cell].piece} ".white_on_blue if cell.odd?
        end
      end
    end
    print "\n"
  end

  def set_board
    set_pawns
    set_nobles
  end

  def set_pawns
    @board[1].each_index do |index|
      @board[1][index] = Pawn.new([1, index], :white)
    end
    @board[6].each_index do |index|
      @board[6][index] = Pawn.new([6, index], :black)
    end
  end

  def set_nobles
    set_white_nobles
    set_black_nobles
  end

  def set_white_nobles
    @board[0].each_index do |index|
      case index
      when 0, 7
        @board[0][index] = Rook.new([0, index], :white)
      when 1, 6
        @board[0][index] = Knight.new([0, index], :white)
      when 2, 5
        @board[0][index] = Bishop.new([0, index], :white)
      when 3
        @board[0][3] = Queen.new([0, 3], :white)
      when 4
        @board[0][4] = King.new([0, 4], :white)
      end
    end
  end

  def set_black_nobles
    @board[7].each_index do |index|
      case index
      when 0, 7
        @board[7][index] = Rook.new([7, index], :black)
      when 1, 6
        @board[7][index] = Knight.new([7, index], :black)
      when 2, 5
        @board[7][index] = Bishop.new([7, index], :black)
      when 3
        @board[7][3] = Queen.new([7, 3], :black)
      when 4
        @board[7][4] = King.new([7, 4], :black)
      end
    end
  end
end

board = Board.new

board.display_board
board.set_board
puts 
board.display_board