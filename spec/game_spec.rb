require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player, name: 'Johnny Cash' }
  let(:player_2) { double :player, name: 'Bruce Springsteen', receive_damage: true }

  it 'returns the names of players participating' do
    expect(game.players).to eq [player_1, player_2]
  end

  it 'can return participating player 1' do
    expect(game.player_1).to eq player_1
  end

  it 'can return participating player 2' do
    expect(game.player_2).to eq player_2
  end

  describe '#attack' do
    it 'damages the opponent\'s HP' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#next_player' do
    it 'increments the turn number after each move' do
      game.switch_turns
      expect(game.turn).to eq 1
    end

    it 'tells us the name of the next player to move' do
      game.switch_turns
      expect(game.next_player).to eq player_2.name
    end
  end
end
