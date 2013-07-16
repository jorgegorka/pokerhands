class Poker

  def initialize(players)
    @players = players
    generate_hands
  end

  def validate_hand

  end

  private

  def generate_hands
    @players.each do |player|
      evaluate_hand(player)
    end
  end

  def evaluate_hand(player)
    check_flush(player) unless check_pairs(player)
  end

  def check_pairs(player)

  end
end
