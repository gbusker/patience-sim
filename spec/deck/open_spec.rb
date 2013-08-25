require 'deck/open'

describe Deck::Open do

  describe 'empty stack tests' do
    before {@open = Deck::Open.new}

    it 'should expect one of the four kings' do
      @open.expected.count.should == 4
      @open.expected.each { |card| card.should match /^.K$/ }
    end
  end

  describe 'single card tests' do
    # 5 of Diamonds
    before { @open = Deck::Open.new(['D5']) }

    it 'should show one card face up' do
      @open.count.should == 1
      @open.each {|card| card.should == 'D5'}
    end
      
    it 'should expect a black 4 - C4 or S4' do
      @open.expected.sort.should == ['C4','S4']
    end
    
    it 'should expect a C4' do
      @open.expect('C4').should be_true
    end

    it 'should accept a valid card' do
      @open.push('C4').should be_true
    end

    it 'should reject an invalid card' do
      # XXX
      catch (:InvalidCard) { @open.push('C2') }
    end
  end

  describe 'full tests' do
    before do
      @open = Deck::Open.new(['DA'])
    end

    it 'should not expect further cards after an ace' do
      @open.expected.should be_false
    end
  end



end
