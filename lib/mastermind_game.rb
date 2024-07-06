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
    @game_over = false
  end

  private

  attr_accessor :human_player, :computer_player, :board, :round, :peg_row, :game_over

  public

  def display_board
    board.display_board
    computer_player.computer_guess.each { |color| print "#{color} " }
    print "\n"
  end

  def computer_guess
    computer_player.set_computer_guess
  end

  def player_guess
    human_player.valid_guess
  end

  def create_peg_row
    human_player.player_guess.each do |color|
      if computer_player.computer_guess.include?(color) &&
         computer_player.computer_guess.index(color) == human_player.player_guess.index(color)
        peg_row.push("b")
      elsif computer_player.computer_guess.include?(color)
        peg_row.push("w")
      else
        peg_row.push(" ")
      end
    end
    peg_row.shuffle!
  end

  def update_board
    board.fill_peg_row(round, peg_row)
    board.fill_player_row(round, human_player.player_guess)
  end

  def game_over?
    game_over true if human_player.player_guess == computer_guess.computer_guess
    game_over true if rounds > 11
  end

  def play_round; end

  def play_game; end
end

game1 = MastermindGame.new
game1.player_guess
game1.computer_guess
game1.create_peg_row
game1.update_board
game1.display_board


