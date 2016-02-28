require_relative "piece.rb"
require_relative "board.rb"

board = Board.new

board.board[4][3] = Queen.new([4, 3], :white, board)

Queen = board.piece_at(4, 3)

board.display_board

puts Queen.possible_moves.inspect

#Okay, so I need to search through a given piece's possible moves for 'targets' that other pieces occupy. If a target is already occupied, remove that target and any others that match that target's 'direction' and are farther than that target.

#Okay, cool I got that done. Next is handling pawn's special move structure. It can only move 'north' if there are no enemies in the way. It can only move 'northeast' or 'northwest' if enemies are present.