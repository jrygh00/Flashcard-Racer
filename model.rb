class FlashcardGame

  def initialize
    @flashcards = Flashcards.factory_create #deck of flashcard objects
    @board_length = 10
  end

  def winner?

  end

  def move_player_forward(spot_qty)

  end

  def move_player_backwards(spot_qty)

  end

  def get_next_flashcard
    shuffle!
    # sample the flashcard array
  end

end


class Player
  attr_reader :current_position

  def method_name
    @name = name
    @position = 0
  end

  def assign_player_location(new_position)

  end

  def

end


class Flashcards

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

    #cards = []
    #Query
    #cards
  end

  #Compare question with users guess
  def correct?
    #Input: user guess
    #Output: true/false
  end

end


my_game =