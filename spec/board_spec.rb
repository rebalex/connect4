# frozen_string_literal: true

require './lib/connect4'

# set up a game - need a board and two players

# this isn't working - uninitialized constant Board.
describe Connect4::Board do
  describe '#initialize' do
    it 'returns an array of 6 arrays, each of length 7' do
      board = described_class.new
      expect board.grid.to eql([['O', 'O', 'O', 'O', 'O', 'O', 'O'], 
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O', 'O', 'O'], 
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O', 'O', 'O'], 
      ['O', 'O', 'O', 'O', 'O', 'O', 'O']])
    end
  end
  describe '#print_board' do
    it 'returns the board showing where counters have been placed' do
      expect 'a thing of great beauty'
    end
  end
  describe '#place_counter' do
    it 'returns ' do
    end
  end
end
