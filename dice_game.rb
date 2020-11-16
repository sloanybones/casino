require_relative 'dice.rb'
class Dice_game
  def initialize(wallet)
    @dice_menu_title = "**********************************\n   Dice Game (simplified Craps)\n**********************************"
    @dice_prompt_message = "What would you like to do? (Type the number corresponding to your choice.)"
    @dice_menu_options = ["Start Playing", "Read Rules", "View Wallet", "Return to Lobby"]
    @wallet = wallet
  end
  
  def display_game
    puts @dice_menu_title
    @dice_menu_options.each_with_index do |option, index|
      puts "#{index + 1}) #{option}"
    end
    ask_user_choice
  end
  
  def ask_user_choice
    puts "**********************************"
    puts @dice_prompt_message
    @user_choice = gets.strip
    validate_user_choice(@user_choice.to_i)
  end

  def validate_user_choice(user_choice_number)
    if (user_choice_number >= 1 && user_choice_number <= @dice_menu_options.size)
      menu_navigation(user_choice_number - 1)
    else
      puts "#{@user_choice_number} is not a number corresponding to a valid option."
      ask_user_choice
    end
  end

  def menu_navigation(validated_user_choice)
    case validated_user_choice
    when 0
      puts "**********************************"
      place_bet
    when 1
      puts "**********************************"
      view_dice_game_rules
      display_game
    when 2
      wallet_message
      display_game
    when 3
      puts "Thanks for playing!"
      puts "Returning to lobby..."
    else
      puts "That's not a valid choice"
      display_game
    end
  end  

  def view_dice_game_rules
    puts "To win a bet you have to roll a particular winning number."
    puts "If you roll a 2, 3, 4, 10, 11 or 12, you win."
    puts "If you throw a 5, 6, 7, 8 or 9, you lose."
    puts "Payouts are determined according to the specific winning number rolled."
    puts "A 2 pays 3:1, a 3 or 4 pays 1:1 or even money, a 10 or 11 pays 2:1, while a 12 pays the highest or 5:1."
  end

  def place_bet
    puts "Place a bet! (You have $#{@wallet.current_balance}.)"
    @bet = gets.to_i
    if @wallet.validate_money(@bet)
      puts "You are betting #{@bet}"
      @wallet.subtract_money(@bet)
      wallet_message
      start_rolling 
    else
      puts "You don't have enough money for that."
      wallet_message
      display_game
    end
  end

  def start_rolling
    player_dice = Dice.new
    puts "Rolling the dice...\n...\n..."
    player_dice.roll
    puts "You rolled the following: "
    player_dice.show_dice
    puts "\n"
    player_dice.show_sum
    determine_payout(player_dice.return_total)
  end

  def determine_payout(dice_total)
    case dice_total
    when 2
      @wallet.add_money((@bet * 3) + @bet)
      puts "You won $#{(@bet * 3)}!"
    when 3
      @wallet.add_money((@bet * 1) + @bet)
      puts "You won $#{(@bet * 1)}!"
    when 4
      @wallet.add_money((@bet * 1) + @bet)
      puts "You won $#{(@bet * 1)}!"
    when 5 then puts "You lost. Sorry."
    when 6 then puts "You lost. Sorry."
    when 7 then puts "You lost. Sorry."
    when 8 then puts "You lost. Sorry."
    when 9 then puts "You lost. Sorry."
    when 10 
      @wallet.add_money((@bet * 2) + @bet)
      puts "You won $#{(@bet * 2)}!"
    when 11
      @wallet.add_money((@bet * 2) + @bet)
      puts "You won $#{(@bet * 2)}!"
    when 12
      @wallet.add_money((@bet * 5) + @bet)
      puts "You won $#{(@bet * 5)}!"
    end
    wallet_message
    reset_bet
    ask_to_continue_rolling
  end

  def ask_to_continue_rolling
    puts "Would you like to keep playing? (Type 'y' for yes or 'n' for no)"
    case gets.strip.downcase
    when "y"
      place_bet
    when "n"
      display_game
    else
      puts "That's not a valid choice. (Type 'y' for yes or 'n' for no)"
      self.ask_to_continue_rolling
    end
  end
    
  def wallet_message
    puts "**********************************"
    puts "Your wallet currently has $#{@wallet.current_balance}"
    puts "**********************************"
  end

  def reset_bet
    @bet = 0
  end
end



