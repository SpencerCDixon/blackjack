require_relative 'cards'

class Deck
      attr_reader :cards

      def initialize
        @cards = self.build_deck
      end

      def build_deck
          cards = []

          Cards::SUITS.each do |suit|
          Cards::RANKS.each do |rank|
            cards << Cards.new(suit,rank)
              end
            end
          cards.shuffle
          cards.shuffle
      end
end
