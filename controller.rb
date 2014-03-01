# controller class
require_relative 'view.rb'
require_relative 'model.rb'

name = ARGV[0]

class Controller

  #include is for class level methods
  #extend is for instance level
  our_game = FlashcardGame.new(name, 10)

  def game

    game_done = false
    # Loop through until the game is finished, pulling a new card each loop for each player
    #current_player = 0
    until game_done

      View.print_board(racer_positions, length)

      current_card = our_game.get_next_flashcard

      View.print_question(our_game.player.name, current_card.question)
      guess = gets.chomp

      did_they_get_it = current_card.correct?(guess)

      View.respond_to_answer(our_game.player.name, did_they_get_it, current_card.answer)

      sleep(2) # possibly use get to make the user press Enter to continue...

      our_game.move_player(did_they_get_it)

      # Dealing with ties at a later time?
      # current_player += 1
      # if current_player > num_of_players
      #   current_player = 0
      # end
      game_done = our_game.finished?
    end

  end

end

my_controller = Controller.new

my_controller.game