require_relative "piece.rb"
require_relative "board.rb"

def set_board_pointer(board)
  0.upto(7).each do |row|
    0.upto(7).each do |col|
      board.board[row][col].board = board if not board.board[row][col].nil?
    end
  end
end

def chess_game
  board = Board.new
  set_board_pointer(board)
  board.display_board
  white_king = board.white_king
  black_king = board.black_king


  puts "Welcome to Chess!"

  puts "Whites go first"

  until board.game_over?

    puts "Whites, which piece would you like to move? ex: a2"
    white_piece = gets.chomp
    white_piece = board.get_piece(white_piece[0].to_sym, white_piece[1].to_i)

    puts "Whites, where would you like to move your #{white_piece.class}? ex: a3"
    move_to = gets.chomp
    board.set_piece(white_piece, move_to[0].to_sym, move_to[1].to_i)

    board.display_board

    break if board.game_over?
    puts "Black, you're in check" if black_king.check?

    puts "Blacks, which piece would you like to move? ex: a7"
    black_piece = gets.chomp
    black_piece = board.get_piece(black_piece[0].to_sym, black_piece[1].to_i)

    puts "Blacks, where would you like to move your #{white_piece.class}? ex: a6"
    move_to = gets.chomp
    board.set_piece(black_piece, move_to[0].to_sym, move_to[1].to_int)

    board.display_board

    break if board.game_over?
    puts "White, you're in check" if white_king.check?

  end

end

chess_game

#board = Board.new
#set_board_pointer(board)

#board.display_board

#board.board[5][3] = Rook.new([5, 3], :black)
#rook = board.piece_at(5, 3)
#rook.board = board

#board.board[4][3] = Rook.new([4, 3], :white)
#rook_two = board.piece_at(4, 3)
#rook_two.board = board

#board.board[3][3] = King.new([3, 3], :white)
#king = board.piece_at(3, 3)
#king.board = board

#board.space_equals(0, 4, nil)

#board.display_board

#puts rook_two.checkable_move?(5, 3)