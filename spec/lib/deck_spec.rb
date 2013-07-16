require 'spec_helper'

describe Deck do
  describe :methods do
    describe :shuffle do
      it 'should return random cards from the deck' do
        subject.shuffle(5).size.should == 5
      end

      it 'should return unique cards' do
        subject.shuffle(15).uniq.size.should == 15
      end
    end
  end
end
