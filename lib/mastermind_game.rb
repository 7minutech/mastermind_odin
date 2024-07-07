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
    @current_player = ""
    @code = []
    @board = MastermindBoard.new
    @peg_row = []
    @round = 0
    @game_over = false
    @mode = ""
  end

  private

  attr_accessor :human_player, :computer_player, :board, :round, :peg_row, :game_over, :mode, :current_player

  def display_board
    board.display_board
  end

  def choose_mode
    puts "Do you want a creator or guessor (c or g)"
    self.mode = gets.chomp.downcase
  end

  def valid_mode?
    mode == "c" || mode == "g"
  end

  def choose_current_player
    if mode == "g"
      self.current_player = human_player
    else
      self.current_player = computer_player
    end
  end

  def guess(player)
    if player.is_a?(HumanPlayer)
      player.valid_guess
    else
      player.set_computer_guess(peg_row)
    end
  end

  def create_peg_row(player)
    self.peg_row = guess(player).each_with_index.map do |color, index|
      if code[index] == color
        "b"
      elsif code.include?(color)
        "w"
      else
        " "
      end
    end
    peg_row.shuffle!
  end

  def set_code
    self.code = if mode == "g"
                  guess(human_player)
                else
                  computer_player.set_computer_code
                end
    if current_player.is_a?(ComputerPlayer)
      computer_player.give_code(code)
    end
  end

  def update_board(player)
    board.fill_peg_row(round, peg_row)
    board.fill_player_row(round, player.guess)
    display_board
  end

  def game_over_message(player)
    puts "--------"
    player.guess.each { |color| print "#{color} " }
    print "\n"
  end

  def game_over?(player)
    if player.guess == code
      self.game_over = true
      game_over_message
      puts player
    elsif round == 11
      self.game_over = true
      game_over_message
      if mode == "g"
        puts "You lost!"
      else
        puts "You win!"
      end
    end
  end

  def play_round(player)
    guess(player)
    create_peg_row
    update_board
    game_over?(player)
    self.round += 1
  end

  def restart
    choose_mode
    board.wipe_board
    self.game_over = false
    self.player_won = false
    self.round = 0
    play_game
  end

  def restart?
    puts "do you want to play again? (y/n)"
    input = gets.chomp.downcase
    if input == "y"
      restart
    else
      puts "Exiting game..."
    end
  end

  public

  def play_game
    choose_mode while valid_mode? == false
    choose_current_player
    display_board
    set_code
    play_round(current_player) while game_over == false
    restart?
  end
end
