require_relative "human_player"
require_relative "computer_player"
require_relative "mastermind_board"
# defines the master mind game 
# includes a human and computer player 
# and a board
class MastermindGame
  def initialize
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
    @board = MastermindBoard.new
  end

  private

  attr_accessor :human_player, :computer_player, :board

  public

  def display_board
    board.display_board
  end

  def update_board; end

  def play_round; end

  def play_game; end
end

game1 = MastermindGame.new
game1.display_board

