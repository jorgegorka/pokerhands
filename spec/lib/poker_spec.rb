require 'spec_helper'

describe Poker do
  describe :methods do
    describe :validate_hand do
      it 'should return players in order (winner first)' do
        players = [["8S", "KC", "4D", "4H", "8D"], ["JS", "2C", "3D", "4C", "8C"]]
        described_class.new(players).validate_hand.should == [["8S", "KC", "4D", "4H", "8D"], ["JS", "2C", "3D", "4C", "8C"]]
      end
    end
  end
end
