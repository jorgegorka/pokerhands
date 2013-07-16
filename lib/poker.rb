class Poker

  attr_reader :players

  def initialize(players, rules)
    @players = players
    generate_hands(rules)
  end

  private

  def generate_hands(rules)
    @players.each do |player|
      player.value = rules.new(player).apply
    end
  end
end
