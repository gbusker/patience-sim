require 'deck'

# Class describing ace stacks

class Deck::Ace < Deck
  
  CARD_ORDER = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'J', 'Q', 'K']

  def top
    if @deck.count >0
      @deck.last
    else
      '##'
    end
  end

  def expected
    if @deck.count == 0
      ['CA', 'DA', 'HA', 'SA']
    elsif self.top =~ /^.K$/
      false
    else
      [next_card(self.top)]
    end
  end

  def expect(card)
    ! self.expected.find_index(card).nil?
  end

  def push(card)
    card = card.pop if card.respond_to? :pop
    throw :UnExpectedCard unless self.expect(card)
    super
  end

  private 

  def next_card(card)
    next_no = CARD_ORDER.find_index(card[1])+1
    card[0] + CARD_ORDER[next_no]
  end

end

  
