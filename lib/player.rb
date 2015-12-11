class Player
  DEFAULT_HEALTH = 60

  attr_reader :name, :hit_points, :damage

  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HEALTH
  end

  def receive_damage
    @hit_points -= Kernel.rand(26)
  end

end
