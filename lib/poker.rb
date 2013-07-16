class Poker

  attr_reader :players

  def initialize(players, rules)
    @players = players
    generate_hands(rules)
  end

  def winner
    ordered_players.last
  end

  private

  def generate_hands(rules)
    @players.each do |player|
      player.value = rules.new(player).apply
    end
  end

  def ordered_players
    @players.sort_by {|player| player.value}
  end
end
