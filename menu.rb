class Menu
  def initialize(menu_title, menu_options, prompt_message)
    @menu_title = menu_title
    @menu_options = menu_options
    @prompt_message = prompt_message
  end
  
  def display_menu
    puts @menu_title
    @menu_options.each_with_index do |option, index|
      puts "#{index + 1}) #{option}"
    end
  end
  
  def ask_user_choice
    puts @prompt_message
    @user_choice = gets.strip
    @user_choice_number = Integer(@user_choice)
    validate_user_choice(@user_choice_number)
  end

  def validate_user_choice(user_choice_number)
    if (user_choice_number >= 1 && selection <= @menu_options.size)
      return user_choice_number
    else
      puts "@{user_choice_number} is not a number corresponding to a valid option."
      ask_user_choice
    end
  end
  def confirm_user_choice
  end
  def quit
  end

end

