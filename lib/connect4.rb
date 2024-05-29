# frozen_string_literal: true

# Everything you need to play Connect4!
class Connect4
  # For methods specific to the game's board
  class Board
    attr_reader :grid

    def initialize
      @grid = Array.new(6) { Array.new(7, 'O') }
    end

    def print_board
      @grid.each { |row| puts row.join(' ') }
    end
  end

  # For methods specific to the game's player
  class Player
    attr_reader :symbol

    def initialize(symbol)
      @symbol = symbol
    end
  end

  def initialize
    @grid = Board.new
    @player_1 = Player.new('X')
    @player_2 = Player.new('S')
    @current_player = @player_1
  end
end
