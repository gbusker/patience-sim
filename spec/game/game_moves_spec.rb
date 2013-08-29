require 'spec_helper.rb'
require 'game'

# This spec tests the calculation of possible moves
# as well as the performance of possible moves

describe Game do

  before do
    @game = Game.new
  end

  
  describe 'detect possible card moves' do

    it "should detect moves from column to ace" do
      pending
    end

    it "should detect moves from deck to column" do
      pending
    end

    it "should detect moves from deck to ace" do
      pending
    end

    it "should detect moves from ace to column" do
      pending
    end

    it "should detect moves from column to column" do
      pending
    end

  end

  describe 'perform card moves' do

    it "should take a card from deck to column" do
      pending
    end    

    it "should take a card from deck to ace" do
      pending
    end

    it "should take a card from column to ace" do
      pending
    end

    it "should take a card from ace to column" do
      pending
    end

    it "should take a card from column to column" do
      pending
    end
  end
end
