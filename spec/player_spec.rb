require 'player'

describe Player do
  subject(:player_1) { described_class.new('Johnny Cash') }
  subject(:player_2) { described_class.new('Johnny Cash') }
  let(:hit_points) { Player::DEFAULT_HEALTH }
  let(:damage) { Player::DAMAGE }

  it 'returns player\'s name' do
    expect(player_1.name).to eq 'Johnny Cash'
  end

  it 'stores the player\'s HP' do
    expect(player_1.hit_points).to eq hit_points
  end

  describe '#receive_damage' do
    it 'reduces the opponent\'s HP' do
      expect { player_2.receive_damage }
        .to change { player_2.hit_points }.by(-damage)
    end
  end
end
