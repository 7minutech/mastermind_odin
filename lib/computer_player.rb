require 'pry-byebug'

# defines a computer player for
# the master mind game
class ComputerPlayer
  VALID_INPUTS = %w[r o y g b p].freeze
  MAX_COLORS = 4
  MAX_RANGE_COLOR = (1..6).freeze

  def initialize
    @computer_guess = Array.new(4)
    @possible_solutions = []
    set_possible_solutions
    @code = ""
    @score = ""
    @peg_row = []
  end

  private

  attr_writer :computer_guess, :code, :score

  public

  attr_reader :computer_guess, :possible_solutions, :code, :score

  def set_computer_guess
    MAX_COLORS.times do |i|
      computer_guess[i] = VALID_INPUTS.sample
    end
  end

  def smart_computer_guess
    if peg_row.empty?
      self.computer_guess = possible_solutions.sample
      create_peg_row
    else
      set_score
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
    transform_solutions
  end

  def create_peg_row
    self.peg_row = computer_guess.each_with_index.map do |color, index|
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

  def set_score
    self.score = "+#{peg_row.count('b')}-#{peg_row.count('w')}"
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

  def set_code(code)
    self.code = code
  end

  def print_details
    puts(possible_solutions.map(&:join))
    puts code
  end
end
npc = ComputerPlayer.new
