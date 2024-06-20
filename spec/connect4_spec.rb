# frozen_string_literal: true

require './lib/connect4'

describe Connect4 do
  let(:game) { described_class.new }
  describe '#play' do
    it "gets the player's column choice, places their symbol, checks for victory, changes player" do
      expect '???'
    end
  end

  describe '#change_current_player' do
    it 'changes current player; running it again changes the current player to the initial player' do
      first_current_player = game.current_player
      game.change_current_player
      expect(game.current_player).not_to eq(first_current_player)
      game.change_current_player
      expect(game.current_player).to eq(first_current_player)
    end
  end
end
