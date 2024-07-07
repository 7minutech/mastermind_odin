# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze
  MAX_TURNS = (0..11).freeze

  def initialize
    @computer_guess
    @pool_of_solutions = (1111..6666).to_a
    @prev_peg_row = []
    @score = ""
  end

  private

  attr_writer :computer_guess

  public

  attr_reader :computer_guess
  attr_accessor :pool_of_solutions, :prev_peg_row, :score

  def set_computer_code
    self.computer_guess = VALID_INPUTS.sample(4)
  end

  def set_score
    "+#{prev_peg_row.count('b')}-#{prev_peg_row.count('w')}"
  end

  def update_computer_guess(peg_row)
    self.prev_peg_row = peg_row
    self.score = set_score
  end

  def set_computer_guess
    if prev_peg_row.empty?
      pool_of_solutions.sample(1)
    end
  end


  def to_s
    "Computer won"
  end
end
