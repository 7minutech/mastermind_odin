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
    @peg_row = []
    @round = 0
  end

  private

  attr_accessor :human_player, :computer_player, :board

  public

  def create_peg_row
  end

  def computer_guess
    computer_player.set_computer_guess
  end

  def player_guess
    human_player.valid_guess
  end

  def display_board
    board.display_board
  end

  def update_board; end

  def play_round; end

  def play_game; end
end

game1 = MastermindGame.new


