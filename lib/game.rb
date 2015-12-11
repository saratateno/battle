require 'forwardable'

class Game
  extend Forwardable
  def_delegator :player_1, :name, :player_1_name
  def_delegator :player_2, :name, :player_2_name
  def_delegator :player_1, :hit_points, :player_1_hp
  def_delegator :player_2, :hit_points, :player_2_hp

  attr_reader :players, :turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @turn = 0
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    @turn += 1
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  def next_player
    @players[player_selector].name
  end

  private

  def player_selector
    @turn % players.length
  end
end
