class Wins

  attr_accessor :game_board

  def initialize(size)
    @size = size
    @game_board = Array.new(@size*@size) { |i| "" }
  end

  # def get_h_wins
  #   h_wins = []
  #   count = @game_board.count
  #   # until count = 0
  #   win = []

  #   .push()
  #   # end
  # end

end

wins = Wins.new(3)
p wins.game_board
p wins.game_board.count