require 'deck'

#
# Column implements a stack in patience.  A column might have a closed and an open stack 
# of any 0-6 or 0-13 cards.
#

class Column

  class Deck::Closed < Deck
    def each
      @deck.each {|card| yield '##'}
    end
  end

  def initialize
    @open = Deck::Open.new
    @closed = Deck::Closed.new
  end

  def open
    @open
  end

  def closed
    @closed
  end

  def count
    @closed.count + @open.count
  end

  def [](n)
    n_closed = @closed.count
    if n<n_closed
      "##"
    elsif n<n_closed+@open.count
      self.open[n-n_closed]
    else
      "  "
    end  
  end

  def output_s
    out = ''
    @closed.each { out << "##\n" }
    @open.each { |card| out << "#{card}\n" }
    
    out
  end

end
