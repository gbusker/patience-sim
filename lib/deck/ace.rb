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
      no = self.top[1]
      next_no = CARD_ORDER.find_index(no)+1
      [self.top[0] + CARD_ORDER[next_no]]
    end
  end

  def expect(card)
    ! self.expected.find_index(card).nil?
  end

  def push(card)
    throw :UnExpectedCard unless self.expect(card)
    super
  end




end

  