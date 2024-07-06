# defines the human player for
# the master mind game
class HumanPlayer
  VALID_INPUTS = %w[r o y g b p].freeze

  def initialize
    @player_guess
  end

  private

  attr_writer :player_guess

  public

  attr_reader :player_guess

  def ask_player_guess
    puts "Chose 4 colors from below like (r,o,y,g)"
    puts "r=red, o=orange, y=yellow, g=green, b=blue, p=purple"
    print "Enter a guess: "
    self.player_guess = gets.chomp.downcase.split(",")
  end

  def valid_input?
    player_guess.each do |color|
      unless VALID_INPUTS.include?(color)
        puts "Please enter a valid input"
        return false
      end
    end
  end

  def valid_guess
    ask_player_guess
    ask_player_guess until valid_input?
  end
end
