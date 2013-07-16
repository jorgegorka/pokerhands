require 'spec_helper'

class TestRules
  def initialize(player)
  end

  def apply
    99
  end
end

describe Poker do

  # two pairs
  let(:player1) {
    Player.new(
      'Player 1',
      [
        Card.new('J', 'C', 11),
        Card.new('2', 'C', 2),
        Card.new('J', 'D', 11),
        Card.new('6', 'C', 6),
        Card.new('2', 'H', 2)
      ]
    )
  }

  #poker
  let(:player2) {
    Player.new(
      'Player 2',
      [
        Card.new('K', 'C', 13),
        Card.new('K', 'D', 13),
        Card.new('K', 'H', 13),
        Card.new('K', 'S', 13),
        Card.new('A', 'H', 14)
      ]
    )
  }

  #straight
  let(:player3) {
    Player.new(
      'Player 3',
      [
        Card.new('8', 'C', 8),
        Card.new('9', 'D', 9),
        Card.new('T', 'H', 10),
        Card.new('J', 'S', 11),
        Card.new('Q', 'H', 12)
      ]
    )
  }

  subject { described_class.new([player1, player2, player3], TestRules) }

  describe :methods do
    describe :validate_hand do
      it 'should evaluate player 1 according to the selected rules' do
        subject.players[0].value.should == 99
      end
    end

    describe :winner do
      it 'returns the player who wins this hand' do
        player1.stub(:value).and_return(3)
        player2.stub(:value).and_return(6)
        subject.winner.should == player3
      end
    end
  end
end
