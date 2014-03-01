# controller class
require_relative 'view.rb'
require_relative 'model.rb'



class Controller

  #include is for class level methods
  #extend is for instance level


  def game(name, length)

    our_game = FlashcardGame.new(name, length)
    game_done = false
    # Loop through until the game is finished, pulling a new card each loop for each player
    #current_player = 0
    until game_done

      racer_positions = []
      racer_positions << our_game.player.current_position

      View.print_board(racer_positions, length)

      current_card = our_game.get_next_flashcard

      View.print_question(our_game.player.name, current_card.question)

      sleep(3)
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

    View.print_winner(our_game.player.name)

  end

end

name = ARGV[0]
length = 10
ARGV.clear

my_controller = Controller.new

my_controller.game(name,length)