require_relative 'hand'

class Dealer
attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

end
