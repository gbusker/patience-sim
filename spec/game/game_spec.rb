require 'spec_helper.rb'
require 'deck'
require 'game'
require 'column'

describe Game do

  before do
    @game = Game.new
  end

  it "should be able to lay out the cards" do
    deck = Deck.full
    @game.lay(deck)
    
    # 52 cards - 28 on table = 24 left
    deck.count.should == 24
  end

  it "should tell us what the longest column is" do
    @game.lay(Deck.full)
    @game.longest_column_length.should == 7
  end


  it "should be able to print the table" do
    @game.lay(Deck.full)
    @game.output_table.length.should > 50 
  end
  
  it "should be able to print the aces" do
    @game.output_aces.length.should > 10
  end

  it "should be able to see open cards" do
    @game.lay(Deck.full)
    # Last card in unshuffled deck (on top) should be first card in game
    @game.output_table.should match /SK/
  end



end
