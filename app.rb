####################################
############ Tic Tac Toe ###########
####################################

require 'sinatra'
require_relative './game/game.rb'

class TicTacToeApp < Sinatra::Base

  enable :sessions  # allow variable value to persist through routes (don't use when need to update value)
  # enable :logging, :dump_errors, :raise_errors

  # reference for tracing variable value:
  # player_type = "Human"
  # puts "player_type: " + player_type.inspect

  # variables to hold player scores (global to persist through new game instances)
  $x_score = 0  # global for X score to persist through multiple games
  $o_score = 0  # global for O score to persist through multiple games

  # # route to trace variables through route iterations
  # before do
  #   log = File.new("sinatra.log", "a")
  #   STDOUT.reopen(log)
  #   STDERR.reopen(log)
  # end

  # route to prompt player for game board size
  get '/' do
    session[:intro] = [["", "", ""], ["", "", ""], ["", "", ""]]  # board for intro screens
    erb :get_size, layout: :min_js_layout, locals: {rows: session[:intro]}
  end

  # route to handle game setup and start the game
  post '/start_game' do
    size = params[:size].to_i
    session[:game] = Game.new(size)  # create a new game instance
    player_type = {"p1_type"=>"Human", "p2_type"=>"Human"}  # hard-code player type for now
    session[:game].select_players(player_type)  # initialize player objects based on player_type hash
    session[:p1_type] = session[:game].p1_type  # assign p1_type session to @p1_type in game.rb
    session[:p2_type] = session[:game].p2_type  # assign p1_type session to @p2_type in game.rb
    round = session[:game].round  # collect current round for messaging
    rows = session[:game].output_board  # grab the current board to display via layout.erb
    session[:game].set_players  # update player info
    session[:messaging] = session[:game].messaging  # access messaging instance via game instance
    mark = session[:game].m_current  # collect current mark for messaging
    feedback = session[:messaging].human_messaging(round, mark)  # update intro human player messaging
    erb :start, locals: {rows: rows, round: round, feedback: feedback}
  end

  # route to allow input of human player move
  get '/play_human' do
    round = session[:game].round  # collect current round for messaging
    rows = session[:game].output_board  # grab the current board to display via layout.erb
    session[:game].set_players  # update player info
    mark = session[:game].m_current  # collect current mark for messaging
    feedback = session[:messaging].human_messaging(round, mark)  # update intro human player messaging
    erb :play_human, locals: {rows: rows, round: round, feedback: feedback}
  end

  # route to display game board, round and human player move details
  post '/play_human' do
    move = params[:location]  # collect the specified move from play_human form
    session[:game].make_move(move)  # evaluate move for route selection
    feedback = session[:messaging].feedback  # collect the resulting move messaging
    session[:game].set_players  # update player info
    mark = session[:game].m_current  # collect current mark for messaging
    round = session[:game].round  # collect current round for messaging
    rows = session[:game].output_board  # grab the current board to display via layout.erb
    if session[:game].game_over?  # if game is over
      winner = session[:game].end_game  # evaluate endgame items and collect winner for endgame messaging
      endgame_result = session[:messaging].display_results(session[:p1_type], session[:p2_type], winner)
      erb :game_over, layout: :min_js_layout, locals: {rows: rows, round: round, result: endgame_result}  # display final results
    elsif feedback =~ /^That/  # if feedback ~ taken position, reprompt via play_human
      erb :play_human, locals: {rows: rows, round: round, feedback: feedback}
    else  # otherwise display move results
      feedback = session[:messaging].human_messaging(round, mark)  # update human player messaging
      erb :result_human, locals: {rows: rows, round: round, feedback: feedback}
    end
  end

  # # route for front-end testing to use game_over views in /play_ai and /result_human
  # get '/game_over_test' do
  #   session[:game].round = 5  # use for front-end testing
  #   session[:game].board.game_board = ["X", "X", "", "", "O", "", "O", "", ""]
  # end

  # # route for front-end testing to use game_over views in /play_ai and /result_human
  # get '/location_taken_test' do
  #   session[:game].round = 3  # use for front-end testing
  #   session[:game].board.game_board = ["X", "", "", "", "O", "", "", "", ""]
  # end

end