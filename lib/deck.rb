
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
    @deck.push card
  end

  def count
    @deck.count
  end

  def empty?
    @deck.count == 0 
  end

  def each3 
    i = 1
    while i*3 <= @deck.count do
      yield @deck[i*3]
      i = i+1
    end
    if @deck.count > (i-1)*3 
      yield @deck.last
    end
  end
    
  # Very simple : just take two random cards and swap them, n times
  def shuffle(n)
    if @deck.count <= 1 
      throw CannotShuffle
    end
    while n>0 do
      card1 = rand(@deck.count)
      while (card1 == (card2 = rand(@deck.count)))
      end
      self.swap(card1,card2)
      n=n-1
    end
    
  end

  def cut
    @deck.rotate!(@deck.count/2)
  end

  protected

  def swap(a,b)
    carda = @deck[a]
    @deck[a] = @deck[b]
    @deck[b] = carda
  end


end
  

