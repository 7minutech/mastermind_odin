require 'pry-byebug'

# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze

  def initialize
    @computer_guess = Array.new(4)
  end

  private

  attr_writer :computer_guess

  public

  attr_reader :computer_guess

  def set_computer_guess
    4.times do |i|
      self.computer_guess[i] = VALID_INPUTS.sample
    end
    binding.pry
  end
end
