require_relative "human_player"
require_relative "computer_player"
require_relative "mastermind_board"
# defines the master mind game 
# includes a human and computer player 
# and a board
class MastermindGame
  BLACK_PEG = 2
  WHITE_PEG = 1
  BLANK_PEG = 0
  def initialize
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
    @board = MastermindBoard.new
    @peg_row = []
    @round = 0
  end

  private

  attr_accessor :human_player, :computer_player, :board, :round, :peg_row,

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
        peg_row.push(BLACK_PEG)
      elsif computer_player.computer_guess.include?(color)
        peg_row.push(WHITE_PEG)
      else
        peg_row.push(BLANK_PEG)
      end
    end
  end

  def update_board; end

  def play_round; end

  def play_game; end
end

game1 = MastermindGame.new
game1.player_guess
game1.computer_guess
game1.create_peg_row
game1.display_board


