require 'pry-byebug'

# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze
  MAX_COLORS = 4
  MAX_SOLUTIONS = (1111..6666).freeze

  def initialize
    @computer_guess = Array.new(4)
    @possible_solutions = []
    set_possible_solutions
  end

  private

  attr_writer :computer_guess

  public

  attr_reader :computer_guess, :possible_solutions

  def set_computer_guess
    MAX_COLORS.times do |i|
      computer_guess[i] = VALID_INPUTS.sample
    end
  end

  def set_possible_solutions
    MAX_SOLUTIONS.each do |num|
      possible_solutions.push(num.to_s)
    end
  end
end

