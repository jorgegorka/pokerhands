class Deck
  attr_reader :game_hand

  def shuffle(how_many_cards)
    full_deck.shuffle[0, how_many_cards]
  end

  private

  def full_deck
    @full_deck ||= create_full_deck
  end

  def create_full_deck
    cards = []
    values.each do |k, v|
      suits.each do |suit|
        cards << Card.new(k, suit, v)
      end
    end
    cards
  end

  def suits
    ['C', 'D', 'H', 'S']
  end

  def values
    {
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      'T' => 10,
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 14
    }
  end
end
