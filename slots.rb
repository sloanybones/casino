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
        @slot_char = ['!'.colorize(:red), 
        '@'.colorize(:green), 
        '#'.colorize(:yellow), 
        '$'.colorize(:magenta), 
        '%'.colorize(:cyan), 
        '^'.colorize(:blue), 
        '&',
        '*'.colorize(:white)]


    end
    def display_game
        #display a welcome
        welcome_message = "Welcome to the Slot Machine!"
        border = welcome_message.gsub(/\s|\S/, '~').colorize(:yellow)
        rules = "Rules: \n. Place a bet\n- bid 1 = $1 \n- bid 5 = $5 \n- big max = $15\n"
        puts border
        puts welcome_message.colorize(:magenta)
        puts border
        puts rules.colorize(:light_white)
        puts "You current balance is: #{@wallet.current_balance}".colorize(:light_cyan)
        puts " "
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
            self.validate_bid
            puts "Placing bid!"
            puts "Good Luck!\n"
            new_bal = @wallet.subtract_money(@bid)
            # puts "Your Balance: #{new_bal}"
            slot_row #call the slot row
            # check if winner
            winner_check
        when 2
            @bid = 5
            self.validate_bid
            puts "Placing bid!"
            puts "Good Luck!\n"
            new_bal = @wallet.subtract_money(@bid)
            # puts "Your Balance: #{new_bal}"
            slot_row #call the slot row
            # check if winner
            winner_check
        when 3
            @bid = 15
            self.validate_bid
            puts "Placing bid!"
            puts "Good Luck!\n"
            new_bal = @wallet.subtract_money(@bid)
            # puts "Your Balance: #{new_bal}"
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
            # p(match)
        if match == 1
            puts "You won!"
            puts "Your balance: $#{@wallet.add_money(@bid + @bid)}"
            self.go_back
        elsif match == 2
            puts "You won!"
            puts "Your balance: $#{@wallet.add_money(@bid + @bid * 0.5)}"
            self.go_back
        elsif match == 3
            puts "You won!"
            puts "Your balance: $#{@wallet.add_money(@bid + @bid * 2)}"
            self.go_back
        elsif match == 4
            puts "BIG WIN!!!"
            puts "Your balance: $#{@wallet.add_money(@bid + @bid * 3)}"
            self.go_back
        else
            puts "Sorry you did not win! :("
            puts "Your balance: $#{@wallet.current_balance}"
            self.go_back
        end
    end

    def go_back
        if @wallet.current_balance == 0
            puts "\nI'm sorry but you do not have enough money to play the slot machine.".colorize(:red)
            puts "Returning you to the main menu".colorize(:red)
            return
        end
        puts "Do you want to play again? y/n"
        input = gets.strip
        
        if input == 'y'
            self.grab_bid
        elsif input == 'n'
            puts "Going back to main menu"
            create_menu_object
        else
            puts "Invalid options try again"
            self.go_back
        end
    end

    def validate_bid
        #validate bid
        if @wallet.validate_money(@bid) == false
            puts "I'm sorry but you do not have enough money to bid this amount."
            puts "Your balance in your wallet is #{@wallet.current_balance}"
            self.grab_bid
        else
            return
        end
    end

    def create_menu_object
        lobby = Menu.new("Casino Games", ["Slots", "High Low", "21", "Dice Game", "Exit"], "Which option would you like to choose?", @wallet)
        lobby.display_menu
    end

end

