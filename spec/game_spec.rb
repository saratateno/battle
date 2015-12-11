require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player, name: 'Johnny Cash' }
  let(:player_2) { double :player, name: 'Bruce Springsteen', receive_damage: true }

  it 'can return participating player 1' do
    expect(game.player_1).to eq player_1
  end

  it 'can return participating player 2' do
    expect(game.player_2).to eq player_2
  end

  describe '#opponent_player' do
    it 'starts the game with player 2 as the opponent' do
      expect(game.opponent_player).to eq player_2
    end

    it 'switches the opponent when the turn is switched' do
      game.switch_turns(player_1)
      expect(game.opponent_player).to eq player_1
    end
  end

  describe '#current_player' do
    it 'starts as player 1' do
      expect(game.current_player).to eq player_1
    end

    it 'switches turns to the opponent' do
      game.switch_turns(player_1)
      expect(game.current_player).to eq player_2
    end
  end
end

# TESTS ON PRIVATE METHODS

# it 'returns the names of players participating' do
#   expect(game.players).to eq [player_1, player_2]
# end
