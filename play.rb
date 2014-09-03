Dir.glob('./classes/*', &method(:require))
require 'pry'

deck = Deck.new
player = Hand.new(deck, "Player")
dealer = Hand.new(deck, "Dealer")

player.deal_hand
puts
player.hit?
puts
player.show_total

puts "-------------"
puts "Dealer's Turn"
puts "-------------"

dealer.deal_hand
puts

dealer.auto_turn
dealer.who_wins?(player)
