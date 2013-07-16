class StandardRules

  def initialize(player)
    @player = player
  end

  def apply
    (@player.pairs.size > 0) ? check_pairs : check_flush
  end

  private

  def check_pairs
    if @player.pairs.size == 1
      check_single_pair
    else
      check_two_or_full
    end
  end

  def check_single_pair
    case @player.pairs.first[1]
    # 2cards
    when 2
      return 2
    # 3cards
    when 3
      return 4
    # poker
    when 4
      return 8
    end
  end

  def check_two_or_full
    @player.any_pair_has?(3) ? 7 : 3
  end

  def check_flush
    if straight_flush?
      return 9
    elsif @player.flush?
      return 6
    elsif @player.straight?
      return 5
    else
      return 1
    end
  end

  def straight_flush?
    @player.straight? and @player.flush?
  end
end
