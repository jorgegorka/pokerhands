require './lib/poker_hands'

players = [
  'Ritchie Blackmoore',
  'Bruce Dickinson',
  'Rob Halford'
]

dealer = LeCroupier.new(players, Poker, StandardRules)
puts dealer.winner
puts '---------------------'
puts dealer.show_hand
