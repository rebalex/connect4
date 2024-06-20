# frozen_string_literal: true

# Everything you need to play Connect4!
class Connect4
  # For methods specific to the game's board
  class Board
    attr_reader :grid_layout

    def initialize(height = 6, width = 7, blank = 'O')
      @height = height
      @width = width
      @blank = blank
      @grid_layout = Array.new(@height) { Array.new(@width, @blank) }
    end

    def print
      @grid_layout.each { |row| puts row.join(' ') }
    end

    # this doesn't have a safety catch for the column being full
    # I need to pull out which row it's placed in. By counting iterations, by with_index?
    def place_counter(column, symbol)
      @row_counter = 0
      @grid_layout.reverse_each do |row|
        @row_counter += 1
        if row[column - 1] == @blank
          row[column - 1] = symbol
          break
        end
      end
    end

    # needed for calculating win condition
    def row_that_counter_is_placed_in
      @height - @row_counter
    end

    def winning_row?(symbol)
      @grid_layout[row_that_counter_is_placed_in].join().include?("#{symbol}#{symbol}#{symbol}#{symbol}")
    end

    def winning_column?(column, symbol)
      if @row_counter < 4
        false
      else
        array_of_column = []
        for n in 0..3 do
          array_of_column << (@grid_layout[row_that_counter_is_placed_in + n][column - 1])
        end
        array_of_column.all?(symbol)
      end
    end

    def full?
      @grid_layout.flatten.count(@blank).zero?
    end
  end

  # For methods specific to the game's player
  class Player
    attr_reader :symbol

    def initialize(symbol)
      @symbol = symbol
    end

    def name
      if @symbol == 'X'
        'Player 1'
      elsif @symbol == 'S'
        'Player 2'
      else
        'Mystery Player'
      end
    end
  end

  attr_reader :current_player

  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('S')
    @current_player = @player1
  end

  def play
    loop do
      @board.print
      print "Which column, #{@current_player.name}? "
      response = gets.chomp.to_i
      place_counter(response, @current_player.symbol) # place counter has moved to Board
      break if @board.win_condition_met?

      change_current_player
    end
    # end_game_screen
  end

  def change_current_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
end
