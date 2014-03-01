require_relative 'racer_utils.rb'
module View
  extend self
  #makes it possible to call self.method. Makes viewer and instance of itself.
  #for modules use extend self

    def print_board(racer_positions, length)
      # racer_positions is an array of the current positions of the player(s)
      # length is the length of the board as an integer.
      # Print board requires racer positions and length to create the board and then print it.
      # This allows changing the length without passing a huge board
      clear!
      reset_cursor!
      car = '_@/'
      board = Array.new(racer_positions.length)
      # Creating a 2D array with each row being the "track" for each player.
      racer_positions.each_index do |index|
        board[index] = Array.new(length) {" . "}
      end
      counter = 0
      board.each do |row|
        row[-1] = " |"
        row[racer_positions[counter]] = " #{counter + 1} "
        p row.join
        counter += 1
      end

    end

    def print_question(player, question)
      # player is a string. question is a string
      # Print the question below the board, including the intended player

      puts ""
      puts "=" * 30
      puts "Player #{player}, it is your turn. Here is your question:"
      puts question

    end

    def respond_to_answer(player, correct_or_not, answer = nil)
      # player is string, correct_or_not is a boolean, answer only required if they guess wrong (is a string)
      # Tells the player whether they were correct or not
      # Tell the player the correct answer if they were wrong.
      # Probably sleep for a little or require the user to press enter to continue.
      if correct_or_not
        puts "Player #{player}, your answer was Correct!"
        puts "You move ahead."
      else
        puts "Player #{player}, your answer was incorrect."
        puts "The correct answer was: #{answer}"
        puts "You move back :`("
      end
    end

    def print_winnner(player)
      puts "Congrats Player #{player}, You have WON!"
      puts "Winner Winner Chicken Dinner!"
      # player is a string
      # Maybe a cool ASCII graphic for the winner!
    end

end

# Driver code when making class a class of itself.

# View.print_board([1,2,3,5], 10)

# View.print_question("1", "How do I ruby?")

# View.respond_to_answer("1", false, "With sublime!")

# View.print_board([1,2,3,9], 10)

# View.print_question("1", "Do you know how to use GIT?")

# View.respond_to_answer("1", true)

# View.print_winnner("1")

# start game
# define player1
# define player2
# print board
# play firt card play 1
# recieve answer
# deliver pass fail
# move the car

# repeat for player 2


# until hit hit end of board
#   declare a winner

