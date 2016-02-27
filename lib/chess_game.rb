require_relative "piece.rb"
require_relative "board.rb"

board = Board.new

board.board[1][0] = King.new([1, 0], :white)

board.display_board

puts board.piece_at(1, 0).location.inspect

puts board.piece_at(1, 0).possible_moves.inspect