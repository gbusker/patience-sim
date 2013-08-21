require 'column'
require 'deck/ace'

class Game

  def initialize
    @col = []
    7.times { @col << Column.new }

    @ace = []
    4.times { @ace << Deck::Ace.new }
  end
  
  def lay(deck)
    # Simulate exactly how the cards are layed.  open, 6x closed, open, 5x closed, etc
    (0..6).each do |row|

      self.column(row).open.push deck.pop
      ((row+1)..6).each do |col|
        self.column(col).closed.push deck.pop
      end
    end
  end

  def output_aces
    out = ''
    (0..3).each do |i|
      out << "#{@ace[i].top} "
    end
    out << "\n"
    out
  end

  def output_table
    out = ''
    
    (0..self.longest_column_length-1).each do |row|
      (0..6).each do |col|
        out << "#{column(col)[row]} "
      end
      out << "\n"
    end
    out
  end

  def longest_column_length
    l=0
    self.each {|c| l=c.count if c.count>l}
    l
  end

  protected

  def each 
    @col.each {|c| yield c}
  end

  def column(n)
    throw ColumnIndexOutOfRange if n<0 or n>6
    @col[n]
  end


end
