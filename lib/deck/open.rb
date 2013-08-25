require 'deck'

#
# This class implements the Open stack of cards on the table
#

class Deck::Open < Deck

  CARD_ORDER = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'J', 'Q', 'K']

  def each 
    @deck.each {|card| yield card}
  end
  
  def first
    @deck.first
  end
  
  def last
    @deck.last
  end

  def expected
    return ['CK', 'DK', 'HK', 'SK'] if @deck.empty?

    last = @deck.last
    return false if last =~ /^.A$/

    # Colour:
    if last =~ /^[CS].$/
      cards = ['D','H']
    else
      cards = ['C','S']
    end
    
    # next
    index = CARD_ORDER.find_index(last[1])
    cards.map! {|card| card = card + CARD_ORDER[index-1]}
  end

  def expect(card)
    self.expected.find_index(card) >= 0 
  end

end

