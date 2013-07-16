# Class to deal with the hand a player has on a game
class Player

  attr_accessor :value

  def initialize(cards)
    @cards = cards
  end

  def pairs
    pairs = Hash.new(0)
    @cards.each do |card|
      pairs[card.number] += 1
    end
    pairs.delete_if {|key, value| value == 1 }
    pairs
  end

  # both methods are equal (should refactor later)
  def suit
    pairs = Hash.new(0)
    @cards.each do |card|
      pairs[card.suit] += 1
    end
    pairs.delete_if {|key, value| value == 1 }
    pairs
  end

  def any_pair_has?(value)
    pairs.has_value? value
  end
end
