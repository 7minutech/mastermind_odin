# defines the master mind board object
class MastermindBoard
  WIDTH_OF_BOARD = (0..11).freeze

  def initialize
    @board = Array.new(12) { Array.new(4) { "O" } }
    @board_divider = Array.new(12) { Array.new(1) { "|" } }
    @peg_board = Array.new(12) { Array.new(4) { " " } }
  end

  private

  attr_accessor :board, :board_divider, :peg_board, :shown_board

  public

  def display_board
    WIDTH_OF_BOARD.each do |i|
      puts (board[i] + board_divider[i] + peg_board[i]).join(" ")
    end
  end

  def fill_player_row(row,color_arr)
    board[row] = color_arr
  end

  def fill_peg_row(row, peg_arr)
    peg_board[row] = peg_arr
  end
end
