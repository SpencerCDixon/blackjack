require_relative 'deck'

class Hand
attr_reader :deck, :name
attr_accessor :cards

  def initialize(deck_object, player_name)
    @deck = deck_object
    @cards = []
    @name = player_name
  end

  def deal_player_hand
    2.times do
      card = deck.cards.pop
      cards << card
      puts "#{name} was dealt a #{card}"
    end
  end

# Figure out a way to refractor this to be cleaner. For now will work.
  def deal_dealer_hand
    card1 = deck.cards.pop
    cards << card1
    puts "#{name} was dealt a #{card1}"
    card2 = deck.cards.pop
    cards << card2
    puts "#{name} was dealt a face down card"
  end

  def hand_total
    total = 0
    cards[0].each {|card| total += card.value}
    total
  end

  def hit?
    puts "Hit or stay?"
    answer = gets.chomp.downcase
    


  def hit
    cards << deck.cards.pop(1)
  end

  def stay
    false
  end

end
