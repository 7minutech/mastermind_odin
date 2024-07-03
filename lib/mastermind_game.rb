# defines the master mind game 
# includes a human and computer player 
# and a board
class MasterMindGame
  def initialize (human_player,computer_player,board)
    @human_player = human_player
    @computer_player = computer_player
    @board = board
  end

  private
  attr_accessor :human_player, :computer_player, :board 
end

