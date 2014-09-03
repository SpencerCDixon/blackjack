Dir.glob('./classes/*', &method(:require))
require 'pry'

deck = Deck.new
player = Hand.new(deck, "Player")
dealer = Hand.new(deck, "Dealer")

player.deal_player_hand
puts
dealer.deal_dealer_hand


binding.pry
