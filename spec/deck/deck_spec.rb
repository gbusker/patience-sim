require 'spec_helper.rb'
require 'deck'

describe Deck do
  
  describe "Full deck of cards" do
    
    before do
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
      cards = []
      @deck.each3 do |card| 
        cards << card
      end
      # 52 cards, in steps of 3 = 17*3 + 2
      cards.count.should == 17+1
    end

  end
  
  describe "Shuffling features" do

    before do
      @deck = Deck.full
    end
    
    it "can be shuffled" do
      @olddeck = @deck
      @deck.shuffle(1)
      @olddeck.should_not == @newdeck
    end

    it "can be halved and joined (cut)" do
      @olddeck = @deck
      @deck.cut
      @olddeck.should_not == @newdeck
    end

  end


end
