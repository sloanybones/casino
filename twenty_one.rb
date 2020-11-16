require_relative 'deck.rb'
require_relative 'menu.rb'

class Twenty_one

    def initialize(wallet)
        @wallet = wallet
    end
    
    def create_menu_object
        lobby = Menu.new("Casino Games", ["Slots", "High Low", "21", "Dice Game", "Exit"], "Which option would you like to choose?", @wallet)
        lobby.display_menu
    end

    def display_game
        puts "Welcome to 21, where you can win big!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts ""
        puts "Place your initial bet"
        puts "Note that your current balance is #{@wallet.current_balance}, you can't place a bet that is more than your current balance"
        @bet = gets.strip.to_i
        validated = @wallet.validate_money(@bet)
        if validated == true 
            self.start_the_game
        else
            puts "Sorry you've entered an invalid, try again!"
            self.display_game
        end
    end
        
    

    def start_the_game
        puts "your bet amount is is $#{@bet}"
        @dealer_cards = []
        @player_cards = []
        @dealer_cards.push(self.get_card, self.get_card)
        @player_cards.push(self.get_card, self.get_card)

        puts ""

        puts "Dealer cards are"
        @dealer_card_value = 0
        @dealer_cards.each do |card|
        sum = convert_rank_to_integer_dealer(card[:rank])
        @dealer_card_value = sum + @dealer_card_value
        end
        puts "** -- of -----**"
        puts "** #{@dealer_cards[1][:rank]} of #{@dealer_cards[1][:suit]} **"
        puts "Dealers visible hand value is #{convert_rank_to_integer_dealer(@dealer_cards[1][:rank])}"
        
        puts ""
        
        puts "Players cards are"
        @player_card_value = 0
        @player_cards.each do |card|
        puts "** #{card[:rank]} of #{card[:suit]}**"
        sum = convert_rank_to_integer_player(card[:rank])
        @player_card_value = sum + @player_card_value
        end
        puts "Player's total hand value is #{@player_card_value}"
        puts ""
        if @dealer_card_value == 21
            puts "Dealer Wins!"
            dealer_wins
        elsif @player_card_value == 21
            puts "Player Wins!"
            player_wins
        else
        hit_stand(@dealer_card_value,@player_card_value)
        end
    end
       
    


    def hit_stand(dealer_card_value, player_card_value)
        if dealer_card_value == 21 
            puts "Dealer wins" 
            dealer_wins
        elsif player_card_value == 21
            puts "Player Wins"
            player_wins
        elsif dealer_card_value > 21 && player_card_value <= 21
            puts "Player Wins"
            player_wins
        elsif player_card_value > 21
            puts "Dealer Wins"
            dealer_wins
        else
            puts "Would you like to 1) Hit or 2) Stand? (Please type a number)"
            user_choice = gets.strip.to_i
            if user_choice == 2 
                who_won
            elsif user_choice == 1
                if @dealer_card_value <= 17
                    add_dealer_card
                    add_player_card
                    hit_stand(@dealer_card_value,@player_card_value)
                else
                    add_player_card
                    hit_stand(@dealer_card_value,@player_card_value)
                end
            else
                puts "Please only choose option 1 or 2, please try again."
                hit_stand(@dealer_card_value,@player_card_value)
            end
            
        end
    end

    def who_won
        if @dealer_card_value > 21 && @player_card_value <= 21
            puts "Player Wins"
            player_wins
            
        elsif @player_card_value > 21 
            puts "Dealer Wins"

        elsif @player_card_value > @dealer_card_value
            puts "Player Wins"
            player_wins

        elsif @player_card_value == @dealer_card_value
            puts "Push"
            self.start_the_game

        else puts "Dealer Wins"
            dealer_wins
        end
    end

        def add_player_card
            @player_cards.push(get_card)
            
            puts ""
            puts "Dealers cards are:"
            puts "** -- of -----**"
            puts "** #{@dealer_cards[1][:rank]} of #{@dealer_cards[1][:suit]} **"
            puts "Dealers visible hand value is #{convert_rank_to_integer_dealer(@dealer_cards[1][:rank])}"
            puts ""

<<<<<<< HEAD
=======
            @player_card_value = 0
            puts "Players cards are:"
            @player_cards.each do |card|
            puts "** #{card[:rank]} of #{card[:suit]} **"
            sum = convert_rank_to_integer_player(card[:rank])
            @player_card_value = sum + @player_card_value
            end
            puts "Player's total hand value is #{@player_card_value}"
            puts ""

        end
>>>>>>> ce5864d27d9c934780a7bc3706ef127f51ffb287

        def add_dealer_card
            @dealer_cards.push(get_card)
            @dealer_card_value = 0
            @dealer_cards.each do |card|
            sum = convert_rank_to_integer_dealer(card[:rank])
            @dealer_card_value = sum + @dealer_card_value
            end
        end

        def dealer_reveal
            puts ""
            puts "Dealer cards were:"
            @dealer_cards.each do |card|
                puts "** #{card[:rank]} of #{card[:suit]}**"
            end
            puts "Dealer's total hand value was #{@dealer_card_value}"
            puts ""

        end


        def player_wins
            dealer_reveal
            @wallet.add_money(@bet)
            puts "Congratulations you now have #{@wallet.current_balance}!"
            puts "Would you like to play again? y/n"
            answer = gets.strip
            if answer == "y"
                self.display_game
            else
                create_menu_object
            end    
        end

        def dealer_wins
            dealer_reveal
            @wallet.subtract_money(@bet)
            puts "Too bad! you're current balance is now #{@wallet.current_balance}!"
            puts "Would you like to play again? y/n"
            answer = gets.strip
            if answer == "y"
                self.display_game
            else
                create_menu_object
            end    
        end

    def convert_rank_to_integer_dealer(rank)
        case rank
        when "K" 
            then 10
        when "Q" 
            then 10 
        when "J"
            then 10
        when "1" 
            then 1
        when "2" 
            then 2
        when "3"
            then 3
        when "4"  
            then 4
        when "5"
            then 5 
        when "6"
            then 6  
        when "7" 
            then 7 
        when "8" 
            then 8
        when "9"
            then 9
        when "10"
            then 10
        when "A"
                if @dealer_card_value <17 
                    11
                else 
                    1
                end
        else
            "ERROR!!!!!!"
        end
    end

    def convert_rank_to_integer_player(rank)
        case rank
        when "K" 
            then 10
        when "Q" 
            then 10 
        when "J"
            then 10
        when "1" 
            then 1
        when "2" 
            then 2
        when "3"
            then 3
        when "4"  
            then 4
        when "5"
            then 5 
        when "6"
            then 6  
        when "7" 
            then 7 
        when "8" 
            then 8
        when "9"
            then 9
        when "10"
            then 10
        when "A"
            if @player_card_value <=10 
                11
            else 
                1
            end
        else
            "ERROR!!!!!!"
        end
    end
        
    


        def get_card
            deck = Deck.new()
            @ranks = deck.ranks.sample()
            @suits = deck.suits.sample()
            cards = {
                rank:@ranks,
                suit:@suits
            }
            return cards
        end
         
end
    # card values Ace = 1 or 11 (players choice), 1-10, J=10, q=10 and k = 10

    # dealer deals 2 cars to himself (one is hidden, the other face up)
    # dealer deals two cards to player (these are visible to the user)
    # add up the players cards total value 
    # add up the dealers visible card value
    
    ##Loop this (
    # give the user the options to either hit or stand. 
    # if they user chooses hit, then they get another card
        #display card along with the other 2 that are visible
        #display total value of the card
        #)
    # if they choose stand or total value exceeds 21 then exit the loop 
    
    # If player total is > 21 then dealer automatically wins
    # if player total is < 21 then dealer gets another card until dealers total is > 17 or > 21
                                    # if dealers total is > 17 and <= 21 then compare player total with dealer total.
                                        #if dealer total is higher than player then dealer wins else player wins
                                    # else dealer loses and player wins
                            
    

    #Model view controller
<<<<<<< HEAD

<<<<<<< HEAD
 end
=======
# end
>>>>>>> b09246c6381515b9745d0c3905fde9af6142688d
=======
 
>>>>>>> ce5864d27d9c934780a7bc3706ef127f51ffb287
