require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:player_2) { double :player }

  describe '#attack' do
    it 'damages the opponent\'s HP' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end
end
