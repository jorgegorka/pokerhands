# Class to deal with the hand a player has on a game
class Player

  attr_reader   :name
  attr_accessor :value

  def initialize(name, cards)
    @name  = name
    @cards = cards
  end

  # returns the number of pairs for each value
  def pairs
    pairs = Hash.new(0)
    @cards.each do |card|
      pairs[card.number] += 1
    end
    pairs.delete_if {|key, value| value == 1 }
    pairs
  end

  # return an array of values sorted
  def values
    @cards.map(&:value).sort
  end

  # return the cards in a human readable format
  def show_cards
    @cards.each.map do |card|
      "#{card.number}#{card.suit}"
    end
  end

  # returns the number of pairs for each suit
  # both methods pairs and suit are equal (should refactor later)
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

  def straight?
    (values <=> create_consecutive(values[0])) == 0
  end

  def flush?
    ((suit.size == 1) and (suit.first[1] == 5))
  end

  private

  def create_consecutive(start)
    end_range = start + (@cards.size - 1)
    [*start..end_range]
  end
end
