require 'spec_helper'

describe Player do
  let(:hand1) {
    [
      Card.new('J', 'C', 11),
      Card.new('2', 'C', 2),
      Card.new('J', 'D', 11),
      Card.new('6', 'C', 6),
      Card.new('2', 'H', 2)
    ]
  }

  let(:hand2) {
    [
      Card.new('2', 'C', 2),
      Card.new('3', 'C', 3),
      Card.new('4', 'D', 4),
      Card.new('5', 'C', 5),
      Card.new('6', 'H', 6)
    ]
  }

  let(:hand3) {
    [
      Card.new('2', 'C', 2),
      Card.new('3', 'C', 3),
      Card.new('T', 'C', 10),
      Card.new('5', 'C', 5),
      Card.new('A', 'C', 14)
    ]
  }

  subject { described_class.new('Player 1', hand1) }

  describe :methods do
    describe :pairs do
      it 'should return the amount of cards of the same card number' do
        subject.pairs.size.should == 2
      end
    end

    describe :suit do
      it 'should return the amount of cards of the same suit' do
        subject.suit.size.should == 1
      end
    end

    describe :any_pair_has? do
      it 'returns true if there are the requested number of equal cards' do
        subject.any_pair_has?(2).should be
      end

      it 'returns false if there are not requested number of equal cards' do
        subject.any_pair_has?(3).should be_false
      end
    end

    describe :values do
      it 'returns the values of the cards sorted' do
        subject.values.should == [2, 2, 6, 11, 11]
      end
    end

    describe :show_cards do
      it 'returns the cards human readable' do
        subject.show_cards.should == ['JC', '2C', 'JD', '6C', '2H']
      end
    end


    describe :straight? do
      it 'returns true if hand is a straight' do
        hand = described_class.new('Player 2', hand2)
        hand.straight?.should be
      end

      it 'returns false if hand is not a straight' do
        subject.straight?.should be_false
      end
    end

    describe :flush? do
      it 'returns true if hand is a flush' do
        hand = described_class.new('Player 3', hand3)
        hand.flush?.should be
      end

      it 'returns false if hand is not a flush' do
        subject.flush?.should be_false
      end
    end
  end
end
