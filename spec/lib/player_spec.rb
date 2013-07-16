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

  subject { described_class.new(hand1) }

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
  end
end
