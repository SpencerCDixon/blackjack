class Cards
  attr_reader :suit, :rank

    SUITS = ['♦', '♣', '♠', '♥']
    RANKS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    if rank == 'J' then return 10 end
    if rank == 'Q' then return 10 end
    if rank == 'K' then return 10 end
      #Figure out a way to handle aces for being 1 or 11
    if rank == 'A' then return 11 end
    return rank
  end

  def to_s
    "#{rank}#{suit}"
  end


end
