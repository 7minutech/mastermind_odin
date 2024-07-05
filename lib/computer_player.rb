# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze

  def initialize
    @computer_guess
  end

  private

  attr_accessor :computer_guess

  public

  def set_computer_guess
    self.computer_guess = VALID_INPUTS.sample(4)
  end
end
npc = ComputerPlayer.new
npc.set_computer_guess
npc.display
