# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze

  def initialize
    @computer_guess
  end

  private

  attr_writer :computer_guess

  public

  attr_reader :computer_guess

  def set_computer_code
    self.computer_guess = VALID_INPUTS.sample(4)
  end


  def to_s
    "Computer won"
  end
end
