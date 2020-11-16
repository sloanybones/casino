require_relative 'high_low.rb'
require_relative 'slots.rb'
require_relative 'twenty_one.rb'
require_relative 'dice_game.rb'
require_relative 'wallet.rb'

class Menu
  def initialize(menu_title, menu_options, prompt_message, wallet)
    @menu_title = menu_title
    @menu_options = menu_options
    @prompt_message = prompt_message
    @wallet = wallet
  end
  
  def display_menu()
    puts @menu_title
    @menu_options.each_with_index do |option, index|
      puts "#{index + 1}) #{option}"
    end
    ask_user_choice
  end
  
  def ask_user_choice
    puts @prompt_message
    @user_choice = gets.strip
    @user_choice_number = @user_choice.to_i
    validate_user_choice(@user_choice_number)
  end

  def validate_user_choice(user_choice_number)
    if (user_choice_number >= 1 && user_choice_number <= @menu_options.size)
      # return user_choice_number
      @validated_user_choice = user_choice_number-1
      menu_navigation
      
    else
      puts "#{@user_choice_number} is not a number corresponding to a valid option."
      ask_user_choice
    end
  end

  def menu_navigation
    case @validated_user_choice
    when 0
      slots = Slots.new(@wallet)
      slots.display_game
    when 1
      high_low = HighLow.new(@wallet)
      high_low.display_game
    when 2
      twenty_one = Twenty_one.new(@wallet)
      twenty_one.display_game
    when 3
      dice_game = Dice_game.new(@wallet)
      dice_game.display_game
    else
      puts "Thanks for playing!"
      puts "Are you sure you want to leave? y/n"
      answer = gets.strip
      if answer == "y"
       exit
      else 
        self.display_menu
      end
      
    end
      

      # ["Slots", "High Low", "21", "Dice Game", "Exit"]
  end
 
end

