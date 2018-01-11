#CLI controller
require "pry"
class UpcomingGames::CLI

  def call
    UpcomingGames::Games.info
    game_list
    menu
  end

  def greeting
    date = Time.new
    today = date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s
    puts "------------------------------"
    puts "Upcoming Games as of #{today}"
    puts "------------------------------"
  end

  def game_list
    greeting
    UpcomingGames::Games.upcoming
  end

  def menu
    puts "Please select the game you want to know more about by number, or type exit to leave!"
    input = gets.strip.to_i
    UpcomingGames::Games.display_game_info(input)
    puts "do you want to look at more? Y/N"
      response = gets.strip.upcase
      if response == "Y"
        game_list
        menu
      elsif response == "N"
        goodbye
      else puts "Please enter Y/N or exit"
      end
    if input == "exit"
      goodbye
    end
  end

  def goodbye
    puts "Thanks for checking in, come back for more upcoming games!"
  end
end
