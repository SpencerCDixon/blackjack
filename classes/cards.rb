class Cards
  attr_reader :suit, :rank

    SUITS = ['♦', '♣', '♠', '♥']
    RANKS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end



  def to_s
    "#{rank}#{suit}"
  end


end
