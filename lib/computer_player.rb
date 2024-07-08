require 'pry-byebug'

# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze
  MAX_COLORS = 4
  MAX_SOLUTIONS = (1111..6666).freeze
  MAX_RANGE_COLOR = (1..6).freeze

  def initialize
    @computer_guess = Array.new(4)
    @possible_solutions = []
    v2_set_possible_solutions
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

    MAX_RANGE_COLOR.each do |i|
      MAX_RANGE_COLOR.each do |j|
        MAX_RANGE_COLOR.each do |k|
          MAX_RANGE_COLOR.each do |l|
            possible_solutions.push("#{i}#{j}#{k}#{l}".chars)
          end
        end
      end
    end
  end

  def transform_solutions
    possible_solutions.each do |solution|
      solution.map! do |number|
        case number
        when "1"
          "r"
        when "2"
          "o"
        when "3"
          "y"
        when "4"
          "g"
        when "5"
          "b"
        when "6"
          "p"
        end
      end
    end
  end

  def print_details
    puts(possible_solutions.map(&:join))
  end
end
npc = ComputerPlayer.new
npc.print_details
