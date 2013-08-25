#
# Deck implements a simple deck of cards
#


class Deck

  def initialize(deck = [])
    @deck = deck
  end

  def self.full
    deck = []
    ["C","D","H","S"].each do |colour|
      ["A","2","3","4","5","6","7","8","9","0","J","Q","K"].each do |num|
        deck << "#{colour}#{num}"
      end
    end 
    self.new(deck)
  end

  def pop
    @deck.pop
  end

  def push(card)
    if card.respond_to? :pop
      @deck.push card.pop
    else
      @deck.push card
    end
  end

  def count
    @deck.count
  end

  def empty?
    @deck.count == 0 
  end

  def each3 
    @deck.each_slice(3) { |set_of_three| yield set_of_three.last }
  end
    
  # Very simple : just take two random cards and swap them, n times
  def shuffle(n_times)
    no_cards = @deck.count
    if no_cards <= 1 
      throw :CannotShuffle
    end
    while n_times>0 do
      card_one = rand(no_cards)
      while (card_one == (card_two = rand(no_cards)))
      end
      self.swap(card_one,card_two)
      n_times=n_times-1
    end
    
  end

  def cut
    @deck.rotate!(@deck.count/2)
  end

  def [](index)
    if index>=0 and index<@deck.count
      @deck[index]
    else
      throw :IndexOutOfRange
    end
  end


  protected

  def swap(index_a,index_b)
    save_card_a = @deck[index_a]
    @deck[index_a] = @deck[index_b]
    @deck[index_b] = save_card_a
  end

end
  

