require_relative 'deck.rb'

class HighLow

    # place your bet
    # store the bet (deduct from wallet)
    # dealer shows first card
    # store first card value
    # ask user if card will be higher or lower
    # deal draws second card
    # store second card value
    # if their guess is true then they win, else they lose
    # money deducted or added from wallet (class)
    # ask user if they want to bet again
    # if yes then loop back to the top else exit go back to menu/lobby

    def initialize
    end

    def display_game
        puts "Welcome to High Low!"
    end

    def get_bet
    puts "Place a bet"
    @bet = gets.strip.to_i
    end

    def show_card_1
    test_deck = Deck.new()
    test_deck.random_card
    end

 

    


end
