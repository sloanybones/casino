require_relative 'deck.rb'
require_relative 'menu.rb'
require_relative 'wallet.rb'


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
    class HighLow
    def initialize(wallet)
        @wallet = wallet
        
    end
    
    
    def display_game
        puts "*******  Welcome to High Low!  *******"
        puts "----------------------------------------------------------------"
        puts "Here's the rules:"
        puts "Place a bet. Dealer will show a card."
        puts "Make a guess if the follwing dealer draw" 
        puts "will be higher or lower than the first card presented."
        puts "The dealer will then draw a card. If that card corresponds with"
        puts "your guess, you win. If not, the dealer recieves your bet unless"
        puts "they match then you triple your bet! Aces are low!"
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
           back_to_menu
    end 
    end
    
    def get_bet
        puts "You current wallet total is $#{@wallet.current_balance}. Place a bet."
        @bet = gets.strip.to_i
         @wallet.subtract_money(@bet)
        show_card_1
    end
   
    
    
    
    def show_card_1
     @cardy = []
        puts " "
        test_deck = Deck.new
        card = test_deck.random_card
        @cardy << card
        @cardy.each do |card|
        puts " "
        puts "Will the next card be higher or lower than #{card.rank} #{card.suit} #{card.color}?" 
        puts " "
        puts "1) Higher"
        puts "2) Lower"
        choice = gets.to_i
        case choice
        when 1
            puts " "
            @cardy2 = []
            try = Deck.new()
            card1 = try.random_card
            @cardy2 << card1
            @cardy2.each do |card1|
            end
            if card1.rank > card.rank
                win
            elsif
                card1.rank == card.rank
                equal
            elsif
               card1.rank < card.rank
                lose
            end
        
    
        
            when 2
            puts " "
            @cardy3 = []
            try2 = Deck.new()
            card2 = try2.random_card
            @cardy3 << card2
            @cardy3.each do |card2|
            end
            if card2.rank < card.rank
                win
            elsif
                card2.rank == card.rank
                equal
            elsif
                card2.rank > card.rank
                lose
            end
            else
                "Invalid Choice try again"
                get_bet
        
            end
        end
    end
end


  
       def win
            puts " "
            puts "**** WIN! You doubled your bet! ****"
            puts "$#{@bet * 2}"
            puts "You current wallet total is $#{@wallet.current_balance}"
            puts " "
            self.play_again
        
        
        end

        def lose
           puts " "
           puts "YOU LOST"
           puts "-$#{@bet}"
           puts "Your wallet total is $#{@wallet.current_balance}"
           puts " "
           self.play_again
        end
      
      
        def equal
            puts " "
            puts "It's a match! TIMES 3!"
            puts "$#{@bet * 3}"
            puts "You current wallet total is $#{@wallet.current_balance}"
            puts " "
            self.play_again
        end


        def play_again
            puts "Do you want to play again? y/n"
            input = gets.strip
            if input == 'y'
                self.get_bet
            elsif input == 'n'
                back_to_menu
            else
                puts "Invalid options try again"
                back_to_menu
            end
                
            
            end
            def back_to_menu
              lobby =  Menu.new("Casino Games", ["Slots", "High Low", "21", "Dice Game", "Exit"], "Which option would you like to choose?", @wallet)
                lobby.display_menu
            end
    
 
