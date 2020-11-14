class Dice_game
  def initialize(wallet)
    @dice_menu_title = "Welcome to the Dice Game (simplified Craps)!"
    @dice_prompt_message = "What would you like to do?"
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
    puts @dice_prompt_message
    @user_choice = gets.strip
    @user_choice_number = @user_choice.to_i
    validate_user_choice(@user_choice_number)
  end

  def validate_user_choice(user_choice_number)
    if (user_choice_number >= 1 && user_choice_number <= @dice_menu_options.size)
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
      puts "you started playing"
    when 1
      puts "here are the rules"
    when 2
      puts "this is your wallet"
    when 3
      puts "returning to lobby"
    else
    end
  end  
end



