require_relative 'deck.rb'
require_relative 'menu.rb'
require_relative 'wallet.rb'

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

    
    attr_accessor :money 
    
    def display_game
        puts "*******  Welcome to High Low!  *******"
        puts "----------------------------------------------------------------"
        puts "Here's the rules:"
        puts "Place a bet. Dealer will show a card."
        puts "Make a guess if the follwing dealer draw" 
        puts "will be higher or lower than the first card presented."
        puts "The dealer will then draw a card. If that card corresponds with"
        puts "your guess, you win. If not, the dealer recieves your bet"
        puts "-----------------------------------------------------------------"
        make_sure
    end

    
    def make_sure
        puts "Ready to play? y/n"
        user_choice = gets.strip
        if user_choice == "y"
            get_bet
        else
            "Sending you back to the lobby"
            lobby
    end 
    end
    
    def get_bet
    puts "You current wallet total is:$ #{Wallet.new.money}. Place a bet."
    choice = gets.strip.to_i
    

    show_card_1
    end
    
    def show_card_1
    test_deck = Deck.new()
    puts test_deck.random_card
    end
    


    def ask
        puts "Will the next card be higher or lower than" #add card just shown
        choice = gets.strip
        if choice == "high"
    end
end
        
        def show_card_2
        test_deck = Deck.new()
        puts test_deck.random_card
        if #the guess matches
            win
        else
            lose
    end
end

        
        def win
            puts "You doubled your bet!"
        end

        def lose
            "YOU LOST"
            play_again
        end

        def play_again
            "Want to play again? y/n"
            user_choice = gets.strip
            if user_choice == "y"
            get_bet
            
            
        end
    end
    
    

end
