# controller class
require_relative 'view.rb'
require_relative 'model.rb'

name = ARGV[0]

class controller

  our_game = FlashcardGame.new(name, 10)

  def move_player!(player, absolute_position)
    # player is the current player
    # absolute_position could also be the move in integer (ie, -1, 2...)
    player[player-1] = absolute_position
  end

  def game

    game_done = false
    # Loop through until the game is finished, pulling a new card each loop for each player
    #current_player = 0
    until game_done


      print_board(racer_positions, length)
      #current_card = select_card
      current_card = our_game.get_next_flashcard

      print_question(our_game.player.name, current_card.question)
      guess = gets.chomp
      current_card.correct?(guess)

      # Dealing with ties at a later time?
      # current_player += 1
      # if current_player > num_of_players
      #   current_player = 0
      # end
      game_done = our_game.finished?
    end

  end

end