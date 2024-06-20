# frozen_string_literal: true

require './lib/connect4'

describe Connect4::Player do
  describe '#symbol' do
    it 'displays expected symbol' do
      player = described_class.new('X')
      expect(player.symbol).to eq('X')
    end
  end

  describe '#name' do
    it 'assigns a name based on the symbol' do
    end
  end
end
