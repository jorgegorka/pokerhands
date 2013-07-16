require 'spec_helper'

describe Poker do
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

  describe :methods do
    describe :validate_hand do
      before :each do
        @game = described_class.new([player1, player2])
      end

      it 'should evaluate player 1 using poker rules' do
        @game.players[0].value.should == 3
      end

      it 'should evaluate player 2 using poker rules' do
        @game.players[1].value.should == 8
      end
    end
  end
end
