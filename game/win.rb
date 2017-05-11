# class to handle win and endgame items
class Win

  # @wins and @win need to be available to the Game class
  # attr_reader :wins, :win
  attr_reader :game_board, :wins, :win  # use for unit testing

  def initialize
    @game_board = []  # populated with current game board by game_over? in Game class
    # @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @wins = []
    @win = []  # populated with winning positions by get_win()
  end

  # Method get the current game board for endgame evaluations
  def update_board(board)
    @game_board = board
  end

  # Method to determine if the game board is full (endgame condition)
  def board_full?
    @game_board.count("") == 0
  end

  # Method to convert game_board into an array of indexes
  def get_board_indexes
    board_indexes = @game_board.each_index.select { |position| game_board[position] }
  end

  # Method to calculate horizontal winning positions
  def get_h_wins(size)
    board_indexes = get_board_indexes
    h_wins = board_indexes.each_slice(size).to_a
  end

  # Method to calculate vertical winning positions
  def get_v_wins(size)
    board_indexes = get_board_indexes
    v_wins = []
    array_counter = 0
    offset_counter = 0
    size.times {
      single_v_win = []
      size.times {
        single_v_win.push(board_indexes[offset_counter])
        offset_counter += size
      }
      v_wins.push(single_v_win)
      offset_counter -= board_indexes.count - 1
      array_counter += 1
    }
    return v_wins
  end  

  # Method to calculate top-left diagonal winning positions
  def get_d_1_wins(size)

  end

  # Method to calculate top-right diagonal winning positions
  def get_d_2_wins(size)

  end

  # Method to populate @wins array with all winning positions
  def populate_wins

  end

  # Method to update @win with the winning positions and return true if player won
  def get_win(positions)
    won = false
    @wins.each { |win| (won = true; @win = win) if positions & win == win }
    won
  end

  # Method to determine if X won (endgame position)
  def x_won?
    x = @game_board.each_index.select { |position| @game_board[position] == "X" }
    get_win(x)
  end

  # Method to determin if O Won (endgame condition)
  def o_won?
    o = @game_board.each_index.select { |position| @game_board[position] == "O" }
    get_win(o)
  end

end


#Sandbox testing

# win = Win.new
# size = 6
# board = Array.new(size*size) { |i| "" }
# win.update_board(board)
# p win.get_v_wins(size)
