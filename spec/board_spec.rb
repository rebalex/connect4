# frozen_string_literal: true

require './lib/connect4'

# place_counter method is under Connect4, not Board. Is that a reason why tests are failing and, if so,
# how do I include it?
describe Connect4::Board do
  let(:board) { described_class.new }

  describe '#grid_layout' do
    it 'returns an array of 6 arrays, each of length 7' do
      expect(board.grid_layout).to eql([['O', 'O', 'O', 'O', 'O', 'O', 'O'], 
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O', 'O', 'O'], 
      ['O', 'O', 'O', 'O', 'O', 'O', 'O'], ['O', 'O', 'O', 'O', 'O', 'O', 'O'], 
      ['O', 'O', 'O', 'O', 'O', 'O', 'O']])
    end
  end

  describe '#print' do
    it 'prints the current state of the board' do
    $stdout = StringIO.new
    board.print
    $stdout.rewind

    expect($stdout.gets).to eq("O O O O O O O\n")
    expect($stdout.gets).to eq("O O O O O O O\n")
    expect($stdout.gets).to eq("O O O O O O O\n")
    expect($stdout.gets).to eq("O O O O O O O\n")
    expect($stdout.gets).to eq("O O O O O O O\n")
    expect($stdout.gets).to eq("O O O O O O O\n")
    end
  end

  describe '#place_counter' do
    context 'empty column' do
      it 'places a counter in the lowest empty space in the given column' do
        board.place_counter(2, 'X')
        expect(board.grid_layout[5]).to eql(['O', 'X', 'O', 'O', 'O', 'O', 'O'])
      end
    end
  
    # this isn't finished because the code hasn't been written
    context 'full column' do
      it 'places a counter in the lowest empty space in the given column' do
        6.times { board.place_counter(2, 'X') }
        expect(board.grid_layout[1]).to eql(['O', 'X', 'O', 'O', 'O', 'O', 'O'])
        board.place_counter(2, 'X')
        expect(board.grid_layout[1]).to eql(['O', 'X', 'O', 'O', 'O', 'O', 'O'])
      end
    end
  end

  describe '#row_that_counter_is_placed_in' do
    it 'returns the index of the row of the grid layout that the counter is placed in' do
      5.times { board.place_counter(2, 'X') }
      expect(board.row_that_counter_is_placed_in).to eql(1)
    end
  end

  describe 'winning_row?' do
    context 'there is not a horizontal row of four' do
      it 'checks to see if there are four in a row horizontally' do
        board.place_counter(1, 'X')
        board.place_counter(2, 'X')
        board.place_counter(3, 'X')
        expect(board.winning_row?('X')).to eq(false)
      end
    end

    context 'there is a horizontal row of four' do
      it 'checks to see if there are four in a row horizontally' do
        board.place_counter(1, 'X')
        board.place_counter(2, 'X')
        board.place_counter(3, 'X')
        board.place_counter(4, 'X')
        expect(board.winning_row?('X')).to eql(true)
      end
    end
  end

  describe 'winning column?' do
    context 'there are 4 counters in a row vertically' do
      it 'checks if there are 4 in a row vertically' do
        board.place_counter(3, 'X')
        board.place_counter(3, 'X')
        board.place_counter(3, 'X')
        board.place_counter(3, 'X')
        expect(board.winning_column?(3, 'X')).to eq(true)
      end
    end

    context 'there are not 4 counters in a row vertically' do
      it 'checks if there are 4 in a row vertically' do
        board.place_counter(3, 'X')
        board.place_counter(3, 'X')
        board.place_counter(3, 'X')
        expect(board.winning_column?(3, 'X')).to eql(false)
      end
    end
  end

  describe '#full?' do
    context 'board is not full' do
      it 'checks to see whether the board is full' do
        expect(board.full?).to eq(false)
      end
    end

    context 'board is full' do
      it 'checks to see whether the board is full' do
        # can prob simplify the below 6 times repetition
        6.times { board.place_counter(1, 'X') }
        6.times { board.place_counter(2, 'X') }
        6.times { board.place_counter(3, 'X') }
        6.times { board.place_counter(4, 'X') }
        6.times { board.place_counter(5, 'X') }
        6.times { board.place_counter(6, 'X') }
        6.times { board.place_counter(7, 'X') }
        board.place_counter(1, 'S')
        expect(board.full?).to eq(true)
      end
    end
  end
end
