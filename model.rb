require_relative 'setup.rb'

class FlashcardGame
  attr_reader :player

  def initialize(player, length_of_board)
    @flashcards = Flashcard.factory_create #deck of flashcard objects
    @board_length = length_of_board - 1
    @player = Player.new(player)
  end

  def winner?
    # For future use. Multiple players
  end

  def finished?
    @player.current_position == @board_length
  end

  # TODO REFACTOR
  def move_player(result)
    if result
      if (@player.current_position + 2) > @board_length
        @player.current_position = @board_length
      else
        @player.current_position += 2
      end
    else
      if (@player.current_position - 1) < 0
        @player.current_position = 0
      else
        @player.current_position -= 1
      end
    end
  end

  def get_next_flashcard
    @flashcards.shuffle!.sample
  end

end


class Player
  attr_accessor :current_position
  attr_reader :name

  def initialize(name)
    @name = name
    @current_position = 0
  end

  def move_forward
    # TODO Refactor move_player
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

# # p Flashcard.query_all_cards
# game = FlashcardGame.new("Michael", 10)
# p game.finished?
# p game.move_player(true)
# p game.player.current_position
# p game.move_player(false)
# p game.player.current_position
# p game.move_player(false)
# p game.move_player(false)
# p game.player.current_position
# # p game.player.move_player(false)
# card = game.get_next_flashcard
# p card.correct?("kjhsdkjfh")
