require 'deck/ace'

describe Deck::Ace do
  
  describe 'Empty stack tests' do

    before { @ace_stack = Deck::Ace.new }
      
    it "should show ## as the top of the empty stack" do
      @ace_stack.top.should == '##'
    end

    it "should return true on an ace as a expected card" do
      @ace_stack.respond_to?(:expect).should be_true
      @ace_stack.expect("DA").should be_true
    end

    it "should show an array with 4 aces as the expected cards" do
      @ace_stack.respond_to?(:expected).should be_true
      @ace_stack.expected.count.should == 4
      (0..3).each { |i| @ace_stack.expected[i].should match /^.A$/ }
    end
    
    it "should accept an ace in a push" do
      @ace_stack.push 'DA'
    end

    it "should not accept a card that is not an ace" do
      catch (:UnExpectedCard) {@ace_stack.push 'D2'}
    end

  end

  describe 'Test of fuller stacks' do

    before do
      @ace_stack = Deck::Ace.new
      @ace_stack.push 'DA'
    end

    it "should report one expected card" do
      @ace_stack.expected.count.should == 1
      @ace_stack.expect('D2').should be_true
    end

    it "should accept a 2 of Diamonds" do
      @ace_stack.push 'D2'
    end

    it "should fill up to a king and not expect further cards" do
      ['D2','D3','D4','D5','D6','D7','D8','D9','D0','DJ','DQ','DK'].each {|card| @ace_stack.push card}
      @ace_stack.expected.should be_false
    end

  end

end
