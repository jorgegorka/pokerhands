class LeCroupier

  def initialize(players, game, rules)
    @players = players
    @game    = game
    @rules   = rules
    @players_with_cards = []
    generate_cards
  end

  def winner
    @game.new(@players_with_cards, @rules)
    "#{winner_message} we have a winner! Monsieur: #{@game.winner.name}"
  end

  private

  def winner_message
    ['Oh lala', "C'est magnifique", 'Mon Dieu'].shuffle.first
  end

  def generate_cards
    assign_card_to_players(Deck.new.shuffle(num_cards))
  end

  def num_cards
    @players.size * @rules.cards_per_hand
  end

  def assign_cards_to_players(cards)
    current_player = 0
    cards.each_slice(@rules.cards_per_hand) do |player_cards|
      @players_with_cards << Player.new(@players[current_player], player_cards)
      current_player += 1
    end
  end
end
