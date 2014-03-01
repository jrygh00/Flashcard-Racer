require_relative 'setup.rb'

class FlashcardGame
  attr_reader :player

  def initialize(player, length_of_board)
    @flashcards = Flashcards.factory_create #deck of flashcard objects
    @board_length = length_of_board - 1
    @player = Player.new(player)
  end

  def winner?
    # For future use. Multiple players
  end

  def finished?
    @player.current_position == @board_length
  end

  def move_player(result)
    if result
      player.@current_position


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


class Flashcard
  include DatabaseConnection
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  #Turns data into flashcard objects
  def self.factory_create
    #Input: 2D array of cards [ [question, answer] ]
    #Output: flashcard objects
    cards = []
    Flashcard.query_all_cards.each do |question, answer|
        cards << self.new(question, answer)
    end
    cards
  end

  def self.query_all_cards
    DatabaseConnection::DB.exec("select question, answer from flashcards;").values # note that sometimes quotes are enough
  end

  #Compare question with users guess
  def correct?(guess)
    #Input: user guess
    #Output: true/false
    guess == @answer
  end

end

# p Flashcard.query_all_cards
p Flashcard.factory_create