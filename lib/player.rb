# Class to deal with the hand a player has on a game
class Player

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
end
