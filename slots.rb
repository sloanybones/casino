require 'colorize'
require_relative 'wallet.rb'
require_relative 'menu.rb'

class Slots
    #make an array of the different items that will show up on the slot machine
    #if user wins yay money 
    #if user loses loss of money :(


# if @wallet.validate_money(bet) == true
#     #continue
# else
#     go get more money

    def initialize(wallet)
        @wallet = wallet

        #array to hold the characters for slot machine
        @slot_char = ['!'.colorize(:light_red), 
        '@'.colorize(:light_green), 
        '#'.colorize(:yellow), 
        '$'.colorize(:magenta), 
        '%'.colorize(:cyan), 
        '^'.colorize(:light_magenta), 
        '&'.colorize(:light_yellow),
        '*'.colorize(:red)]


    end
    def display_game
        #display a welcome
        puts "Welcome to the Slot Machine!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "You current balance is: #{@wallet.current_balance}"
        grab_bid
    
    end
    def grab_bid
        #ask player what they want to bid 
        puts "What would you like to bid?"
        puts "1. Bid 1" #$1
        puts "2. Bid 5" #5
        puts "3. Bid Max" #$15
        choice = gets.strip.to_i

        #subtract bid from player_wallet
        case choice
        when 1
            @bid = 1
            puts "Placing bid!"
            puts "Good Luck!"
            new_bal = @wallet.subtract_money(1)
            puts "Your Balance: #{new_bal}"
            slot_row #call the slot row
            # check if winner
            winner_check
        when 2
            @bid = 5
            puts "Placing bid!"
            puts "Good Luck!"
            new_bal = @wallet.subtract_money(5)
            puts "Your Balance: #{new_bal}"
            slot_row #call the slot row
            # check if winner
            winner_check
        when 3
            @bid = 15
            puts "Placing bid!"
            puts "Good Luck!"
            new_bal = @wallet.subtract_money(15)
            puts "Your Balance: #{new_bal}"
            slot_row #call the slot row
            # check if winner
            winner_check
        else
            puts "Invalid option! Please put 1, 2, or 3"
            choice = gets.strip.to_i
        end

    end

    def random_symbols
        #need to grab randomly characters from the slot machine
        symbol1 = @slot_char.sample
        symbol2 = @slot_char.sample
        symbol3 = @slot_char.sample
        symbol4 = @slot_char.sample
        symbol5 = @slot_char.sample
        @row = [symbol1, symbol2, symbol3, symbol4, symbol5]
    end

    #print the slot row 
    def slot_row
        random_symbols
        border = '---------'.colorize(:light_cyan)
        puts border
        puts @row.join(' ')
        puts border
    end

    #need to check if the user is a winner and how much they won
    def winner_check
        match = 0
        amounts = []
        bang_sign = 0
        at_sign = 0
        pound_sign = 0
        dollar_sign = 0
        percent_sign = 0
        carot_sign = 0
        amp_sign = 0
        star_sign = 0

        @row.each do |item|
            if item == @slot_char[0]
                bang_sign += 1
            elsif item == @slot_char[1]
                at_sign += 1
            elsif item == @slot_char[2]
                pound_sign += 1
            elsif item == @slot_char[3]
                dollar_sign += 1
            elsif item == @slot_char[4]
                percent_sign += 1
            elsif item == @slot_char[5]
                carot_sign += 1
            elsif item == @slot_char[6]
                amp_sign += 1
            elsif item == @slot_char[7]
                star_sign += 1
            end 
        end
            amounts.push(bang_sign)
            amounts.push(at_sign)
            amounts.push(pound_sign)
            amounts.push(dollar_sign)
            amounts.push(percent_sign)
            amounts.push(carot_sign)
            amounts.push(amp_sign)
            amounts.push(star_sign)

            amounts.each do |totals|
                if totals > 1
                    match += 1
                end
            end
            p "how many matches you got: #{match}"
    
        if match == 1
            puts "You won!"
            puts "Your balance: "
            p @wallet.add_money(@bid)
            go_back
        elsif match == 2
            puts "You won!"
            puts "Your balance: "
            p @wallet.add_money(@bid * 0.5)
            go_back
        elsif match == 3
            puts "You won!"
            puts "Your balance: "
            p @wallet.add_money(@bid * 2)
            go_back
        elsif match == 4
            puts "BIG WIN!!!"
            puts "Your balance: "
            p @wallet.add_money(@bid * 3)
            go_back
        else
            puts "Sorry you did not win! :("
            puts "Your balance: "
            @wallet.current_balance
            go_back
        end
    end

    def go_back
        puts "Do you want to play again? y/n"
        input = gets.strip
        if input == 'y'
            self.grab_bid
        elsif input == 'n'
            return
        else
            puts "Invalid options try again"
            self.go_back
        end
    end

end

