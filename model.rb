class DbAccess

end


class FlashcardGame

  def initialize
    @flashcards = Flashcards.factory_create
  end

  def winner?

  end

end


class Player
  def method_name
    @name = name
    @position = 04
  end

  def player_location

  end
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
  end

  #Compare question with users guess
  def correct?
    #Input: user guess
    #Output: true/false
  end

end


my_game =