class Poker

  attr_reader :players

  def initialize(players)
    @players = players
    generate_hands
  end

  private

  def generate_hands
    @players.each do |player|
      evaluate_hand(player)
    end
  end

  def evaluate_hand(player)
    (player.pairs.size > 0) ? check_pairs(player) : check_flush(player)
  end

  def check_pairs(player)
    if player.pairs.size == 1
      check_single_pair(player)
    else
      check_two_or_full(player)
    end
  end

  def check_single_pair(player)
    case player.pairs.first[1]
    # 2cards
    when 2
      player.value = 2
    # 3cards
    when 3
      player.value = 4
    # poker
    when 4
      player.value = 8
    end
  end

  def check_two_or_full(player)
    player.value = player.any_pair_has?(3) ? 7 : 3
  end
end
