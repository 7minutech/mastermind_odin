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
    @player_won = false
  end

  private

  attr_accessor :human_player, :computer_player, :board, :round, :peg_row, :game_over, :player_won

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
    peg_row.clear
    human_player.player_guess.each_with_index do |color, index|
      if computer_player.computer_guess[index] == color
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
    display_board
  end

  def game_over?
    if human_player.player_guess == computer_player.computer_guess
      self.game_over = true
      self.player_won = true
      puts "You won!"
    end
    if round == 11
      self.game_over = true
      puts "You lost!"
    end
  end

  def play_round
    player_guess
    create_peg_row
    update_board
    game_over?
    self.round += 1
  end

  def play_game
    computer_guess
    display_board
    play_round while game_over == false
  end
end

game1 = MastermindGame.new
game1.play_game
