require 'spec_helper.rb'

describe Deck do
  
  describe "Full deck of cards" do
    
    background do
      @deck = Deck.full
    end

    it "has 52 cards" do
      @deck.count.should == 52
    end

    it "can have cards removed" do
      card = @deck.pop
      @deck.count.should == 51
    end

    it "can be read in steps of 3" do
      @deck.each3 do |card| 
        cards << card
      end
      cards.count.should == 12+1
    end

  end
  
  decribe "Shuffling features" do

    background do
      @deck = Deck.full
    end
    
    it "can be shuffled" do
      @olddeck = @deck
      @deck.shuffle(1)
      @olddeck.should_not == @newdeck
    end

    it "can be halved and joined" do
      @olddeck = @deck
      @deck.halve_and_join
      @olddeck.should_not == @newdeck
    end

  end
end
