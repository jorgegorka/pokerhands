require 'spec_helper'

describe Poker do

  # two pairs
  let(:player1) {
    Player.new(
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
      [
        Card.new('8', 'C', 8),
        Card.new('9', 'D', 9),
        Card.new('T', 'H', 10),
        Card.new('J', 'S', 11),
        Card.new('Q', 'H', 12)
      ]
    )
  }

  subject { described_class.new([player1, player2, player3]) }

  describe :methods do
    describe :validate_hand do
      it 'should evaluate player 1 using poker rules' do
        subject.players[0].value.should == 3
      end

      it 'should evaluate player 2 using poker rules' do
        subject.players[1].value.should == 8
      end

      it 'should evaluate player 2 using poker rules' do
        subject.players[2].value.should == 5
      end
    end
  end
end
