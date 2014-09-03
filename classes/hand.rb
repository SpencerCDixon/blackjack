require_relative 'deck'

class Hand
  attr_reader :deck, :name
  attr_accessor :cards
  include Comparable

  def initialize(deck_object, player_name)
    @deck = deck_object
    @cards = []
    @name = player_name
  end

  def pretty_cards
    cards.map {|card| card.to_s}
  end

  def <=>(other_hand)
    if self.hand_total < other_hand.hand_total
      -1
    elsif self.hand_total > other_hand.hand_total
      1
    else
      0
    end
  end

  def deal_hand
    2.times do
      card = deck.cards.pop
      cards << card
      puts "#{name} was dealt a #{card}"
    end
    check_total(score(pretty_cards))
  end

  def hand_total
    total = 0
    cards.each {|card| total += card.value}
    total
  end

  def show_total
    puts "Total: #{hand_total}"
  end

  def check_total(total)
    if total > 21 && name == "Dealer"
      puts "Dealer BUST. You Win!!!!"
      exit
    elsif total > 21
      puts "You BUST. Dealer wins :( "
    else
      puts "#{name} total is: #{total}"
    end
  end

  def hit?
    puts "Hit or stay? (H/S)"
    answer = gets.chomp.downcase
    case answer
    when "h" || "hit"
      hit
    when "s" || "stay"
      stay
    else
      puts "Please choose a correct answer: "
      hit?
    end
  end

  def hit
    card = deck.cards.pop
    cards << card
    puts "#{name} got a #{card}"
    check_total(score(pretty_cards))
    # Need to refractor this, makes dealer not need to be asked to hit/stay
    if name != "Dealer"
      hit?
    end
  end

  def stay
    puts "#{name} stays."
    check_total(score(pretty_cards))
    false
  end

  # Dealers Turn
  def auto_turn
    until score(pretty_cards) >= 17
      hit
      check_total(score(pretty_cards))
    end
  end

  def who_wins?(player_hand)
    if self >= player_hand
      puts "Dealer Wins :("
    else
      puts
      puts "You win!! Yay"
    end
  end

  ### Fix scoring to get best potential hand
  def score(hand)
    if hand == []
      return 0
    end
    number_of_aces = 0 # number of aces to use later
    hand.map! {|card| card.chop} # gets rid of symbols
    number_of_aces = hand.count("A") # Gets rid of aces, keeps track
    hand.delete("A")
    hand.map! do |card|
      if card[0] == "J" || card[0] == "K" || card[0] == "Q"
        10
      else
        card.to_i
      end
    end

    if hand.size == 0
      sum = 0
    else
      sum = hand.inject {|sum, num| sum + num}
    end
    # Add logic to figure out aces
      case number_of_aces
        when 0
          return sum
        when 1
          if sum < 11
            sum + 11
          else
            sum + 1
          end
        when 2
          if sum < 10
            sum + 12
          else
            sum + 2
          end
      end
  end


end
