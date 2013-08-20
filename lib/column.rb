require 'deck'
class Column

  class Stack < Deck
    def [](n)
      return @deck[n]
    end
    def each 
      @deck.each {|card| yield card}
    end
  end

  def initialize
    @open = Stack.new
    @closed = Stack.new
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
