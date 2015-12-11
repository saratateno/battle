require 'forwardable'

class Game
  extend Forwardable
  def_delegator :player_1, :name, :player_1_name
  def_delegator :player_2, :name, :player_2_name
  def_delegator :player_1, :hit_points, :player_1_hp
  def_delegator :player_2, :hit_points, :player_2_hp

  attr_reader :current_player, :opponent_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
    @opponent_player = player_2
  end

  def switch_turns(previous_player)
    @current_player = opponent_player
    @opponent_player = previous_player
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  private
  attr_reader :players
end
