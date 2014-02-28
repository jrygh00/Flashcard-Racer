# controller class
require_relative 'view.rb'

class controller

  def initialize(*player, length_of_board)
    @player_name = player
    @players = [] # array of the number of players all initalized at starting position 0.
  end

  def move_player!(player, absolute_position)
    # player is the current player
    # absolute_position could also be the move in integer (ie, -1, 2...)
    player[player-1] = absolute_position
  end

  def select_card
    # Pull card from deck and pass
  end

  def verify_answer(player_answer, actual)
    # check and deliver answer
    # If correct, tell the player they got it right, and:
    # possibly move the player here or in game method
    # If they got it wrong, tell them they gave wrong answer and provide the correct one
    # possibly move player here of in game method
  end

  def finished?
    # Checks to see if any of the players location is == length of the board
  end

  def game

    # Loop through until the game is finished, pulling a new card each loop for each player
    current_player = 0
    until game.finished?


      print_board(racer_positions, length)
      current_card = select_card

      print_question(cur_player, current_card.question)
      answer = gets.chomp
      verify_answer(answer, current_card.answer)

      # Dealing with ties at a later time?
      current_player += 1
      if current_player > num_of_players
        current_player = 0
      end
    end

  end

end