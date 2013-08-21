require 'deck'
class Column

  class Deck::Open < Deck
    def [](n)
      return @deck[n]
    end
    def each 
      @deck.each {|card| yield card}
    end
  end

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
    if n<@closed.count
      "##"
    elsif n<@closed.count+@open.count
      self.open[n-@closed.count]
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
