require_relative 'menu.rb'
require_relative 'wallet.rb'

lobby = Menu.new("Casino Games", ["Slots", "High Low", "21", "Dice Game", "Exit"], "Which option would you like to choose?")
# slots = Danielle
# high low = Andrew
# 21 = landon
# Dice Game = Joshua



puts "Welcome to the casino"
puts "What is your name?"
player_name = gets.strip
puts "How much money do you have #{player_name}"
player_money = gets.strip.to_i
wallet = Wallet.new(player_money)
wallet.current_balance

lobby.display_menu
