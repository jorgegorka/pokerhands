class Deck
  attr_reader :game_hand

  def shuffle(how_many_cards)
    full_deck.shuffle[0, how_many_cards]
  end

  private

  def random_card
    "#{random_number}#{random_suit}"
  end

  def game_hand
    @game_hand ||= []
  end

  def full_deck
    @full_deck ||= create_full_deck
  end

  def create_full_deck
    cards = []
    values.each do |k, v|
      suits.each do |suit|
        cards << "#{k}#{suit}"
      end
    end
    cards
  end

  def suits
    ['C', 'D', 'H', 'S']
  end

  def values
    {
      2 => 2,
      3 => 2,
      4 => 2,
      5 => 2,
      6 => 2,
      7 => 2,
      8 => 2,
      9 => 2,
      'T' => 2,
      'J' => 2,
      'Q' => 2,
      'K' => 2,
      'A' => 2
    }
  end
end
