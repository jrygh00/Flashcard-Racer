require_relative 'racer_utils.rb'
class view

  @car = '_@/'
  def print_board(racer_positions, length)
    # racer_positions is an array of the current positions of the player(s)
    # length is the length of the board as an integer.
    # Print board requires racer positions and length to create the board and then print it.
    # This allows changing the length without passing a huge board
  end

  def print_question(player, question)
    # player is a string. question is a string
    # Print the question below the board, including the intended player
  end

  def respond_to_answer(player, correct_or_not, answer = nil)
    # player is string, correct_or_not is a boolean, answer only required if they guess wrong (is a string)
    # Tells the player whether they were correct or not
    # Tell the player the correct answer if they were wrong.
    # Probably sleep for a little or require the user to press enter to continue.
  end

  def print_winnner(player)
    # player is a string
    # Maybe a cool ASCII graphic for the winner!
  end

end

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

