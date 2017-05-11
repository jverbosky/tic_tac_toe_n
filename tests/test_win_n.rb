# be sure to use the unit test versions of attr_ in win.rb
# - attr_reader in win.rb

require "minitest/autorun"
require_relative "../game/win.rb"

class TestBoard < Minitest::Test

  def test_1_get_board_indexes_3x3
    win = Win.new
    size = 3
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal(board_indexes, result)
  end

  def test_2_get_board_indexes_4x4
    win = Win.new
    size = 4
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    assert_equal(board_indexes, result)
  end

  def test_3_get_board_indexes_5x5
    win = Win.new
    size = 5
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24]
    assert_equal(board_indexes, result)
  end

  def test_4_get_board_indexes_6x6
    win = Win.new
    size = 6
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_board_indexes
    board_indexes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
    assert_equal(board_indexes, result)
  end

  def test_5_get_horizontal_winning_positions_3x3
    win = Win.new
    size = 3
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_h_wins(size)
    horizontal_wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    assert_equal(horizontal_wins, result)
  end

  def test_6_get_horizontal_winning_positions_4x4
    win = Win.new
    size = 4
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_h_wins(size)
    horizontal_wins = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]]
    assert_equal(horizontal_wins, result)
  end

  def test_7_get_horizontal_winning_positions_5x5
    win = Win.new
    size = 5
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_h_wins(size)
    horizontal_wins = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24]]
    assert_equal(horizontal_wins, result)
  end

  def test_8_get_horizontal_winning_positions_6x6
    win = Win.new
    size = 6
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_h_wins(size)
    horizontal_wins = [[0, 1, 2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17], [18, 19, 20, 21, 22, 23], [24, 25, 26, 27, 28, 29], [30, 31, 32, 33, 34, 35]]
    assert_equal(horizontal_wins, result)
  end

  def test_9_get_vertical_winning_positions_3x3
    win = Win.new
    size = 3
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_v_wins(size)
    vertical_wins = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    assert_equal(vertical_wins, result)
  end

  def test_10_get_vertical_winning_positions_4x4
    win = Win.new
    size = 4
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_v_wins(size)
    vertical_wins = [[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]]
    assert_equal(vertical_wins, result)
  end

  def test_11_get_vertical_winning_positions_5x5
    win = Win.new
    size = 5
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_v_wins(size)
    vertical_wins = [[0, 5, 10, 15, 20], [1, 6, 11, 16, 21], [2, 7, 12, 17, 22], [3, 8, 13, 18, 23], [4, 9, 14, 19, 24]]
    assert_equal(vertical_wins, result)
  end

  def test_12_get_vertical_winning_positions_6x6
    win = Win.new
    size = 6
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_v_wins(size)
    vertical_wins = [[0, 6, 12, 18, 24, 30], [1, 7, 13, 19, 25, 31], [2, 8, 14, 20, 26, 32], [3, 9, 15, 21, 27, 33], [4, 10, 16, 22, 28, 34], [5, 11, 17, 23, 29, 35]]
    assert_equal(vertical_wins, result)
  end

  def test_13_get_top_left_diagonal_winning_positions_3x3
    win = Win.new
    size = 3
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_d_1_win(size)
    diagonal_1_win = [0, 4, 8]
    assert_equal(diagonal_1_win, result)
  end

  def test_14_get_top_left_diagonal_winning_positions_4x4
    win = Win.new
    size = 4
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_d_1_win(size)
    diagonal_1_win = [0, 5, 10, 15]
    assert_equal(diagonal_1_win, result)
  end

  def test_15_get_top_left_diagonal_winning_positions_5x5
    win = Win.new
    size = 5
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_d_1_win(size)
    diagonal_1_win = [0, 6, 12, 18, 24]
    assert_equal(diagonal_1_win, result)
  end

  def test_16_get_top_left_diagonal_winning_positions_6x6
    win = Win.new
    size = 6
    board = Array.new(size*size) { |i| "" }
    win.update_board(board)
    result = win.get_d_1_win(size)
    diagonal_1_win = [0, 7, 14, 21, 28, 35]
    assert_equal(diagonal_1_win, result)
  end


  # def test_1_update_board
  #   win = Win.new
  #   board = ["", "X", "", "", "O", "", "", "X", ""]
  #   win.update_board(board)
  #   result = win.game_board
  #   assert_equal(board, result)
  # end

  # def test_2_verify_all_spots_full
  #   win = Win.new
  #   board = ["X", "O", "X", "X", "O", "O", "O", "X", "X"]
  #   win.update_board(board)
  #   result = win.board_full?
  #   assert_equal(true, result)
  # end

  # def test_3_verify_board_almost_full
  #   win = Win.new
  #   board = ["X", "O", "X", "X", "O", "O", "O", "X", ""]
  #   win.update_board(board)
  #   result = win.board_full?
  #   assert_equal(false, result)
  # end

  # def test_4_verify_game_won_true
  #   win = Win.new
  #   positions = [0, 1, 4, 8]
  #   result = win.get_win(positions)
  #   assert_equal(true, result)
  # end

  # def test_5_verify_game_won_false
  #   win = Win.new
  #   positions = [0, 3, 5, 7]
  #   result = win.get_win(positions)
  #   assert_equal(false, result)
  # end

  # def test_6_get_winning_positions_v1
  #   win = Win.new
  #   positions = [0, 1, 4, 8]
  #   win.get_win(positions)
  #   result = win.win
  #   assert_equal([0, 4, 8], result)
  # end

  # def test_7_get_winning_positions_v2
  #   win = Win.new
  #   positions = [0, 3, 5, 6, 7]
  #   win.get_win(positions)
  #   result = win.win
  #   assert_equal([0, 3, 6], result)
  # end

  # def test_8_verify_X_won_false
  #   win = Win.new
  #   board = ["X", "", "", "", "O", "", "", "", ""]
  #   win.update_board(board)
  #   result = win.x_won?
  #   assert_equal(false, result)
  # end

  # def test_9_verify_X_won_true
  #   win = Win.new
  #   board = ["X", "O", "", "", "O", "O", "X", "X", "X"]
  #   win.update_board(board)
  #   result = win.x_won?
  #   assert_equal(true, result)
  # end

  # def test_10_verify_O_won_false
  #   win = Win.new
  #   board = ["X", "", "", "", "O", "", "", "", ""]
  #   win.update_board(board)
  #   result = win.o_won?
  #   assert_equal(false, result)
  # end

  # def test_11_verify_O_won_true
  #   win = Win.new
  #   board = ["X", "", "", "O", "O", "O", "X", "", "X"]
  #   win.update_board(board)
  #   result = win.o_won?
  #   assert_equal(true, result)
  # end

end