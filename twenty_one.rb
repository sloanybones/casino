require_relative 'deck.rb'

 #class Twenty_one

    # def initialize 
    # end

    def display_game
        puts "Welcome to 21, where you can win big!"

    end

    def get_card
        deck = Deck.new()
        @ranks = deck.ranks.sample()
        @suits = deck.suits.sample()
        puts "#{@ranks} of #{@suits}"


    end

    def set_card_values(card)
        
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
 end
=======
# end
>>>>>>> b09246c6381515b9745d0c3905fde9af6142688d
