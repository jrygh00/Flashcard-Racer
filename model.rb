require_relative 'setup.rb'

class FlashcardGame
  attr_reader :player

  def initialize(player, length_of_board)
    @flashcards = Flashcards.factory_create #deck of flashcard objects
    @board_length = length_of_board
    @player = Player.new(player)
  end

  def winner?
    #@board_length == #current player location
  end

  def finished?
    @player.position == @board_length
  end

  def move_player(delta_spot_qty)
    # I: T/F
    # Do not allow the player move less than 0 or more than board_length

  end

  def get_next_flashcard
    shuffle!
    # sample the flashcard array
  end

end


class Player
  attr_reader :current_position

  def initialize
    @name = name
    @current_position = 0
  end

end


class Flashcards
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  #Turns data into flashcard objects
  def factory_create # or Generate cards
    #Input: 2D array of cards [ [question, answer] ]
    #Output: flashcard objects

    # Takes query results from #query_all_cards
    # self.new
    # append results to array
  end

  def query_all_cards
    # Pulls all the cards from the database
    db_connection.exec("select question, answer from flashcards;")
    #cards = []
    #Query
    #cards
  end

  #Compare question with users guess
  def correct?(guess)
    #Input: user guess
    #Output: true/false

    #
  end

end


p player.position #returns current position
p player.