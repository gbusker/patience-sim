require 'column'
require 'deck/ace'

#
# This module implements a patience table with 7x Columns and 4x ace stacks
# It uses the Column and Deck::Ace classes to abstract these concepts
#

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
      self.column(row).open.push(deck)
      ((row+1)..6).each do |col|
        self.column(col).closed.push(deck)
      end
    end
  end

  def output_aces
    out = ''
    @ace.each do |ace|
      out << "#{ace.top} "
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
    longest=0
    self.each {|card| longest=card.count if card.count>longest}
    longest
  end

  protected

  def each 
    @col.each {|column| yield column}
  end

  def column(index)
    throw ColumnIndexOutOfRange if index<0 or index>6
    @col[index]
  end

end
