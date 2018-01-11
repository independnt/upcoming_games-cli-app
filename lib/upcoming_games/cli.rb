#CLI controller
class UpcomingGames::CLI

  def call
    puts "------------------------------"
    greeting
    puts "------------------------------"
    game_list
    menu
  end

  def greeting
    date = Time.new
    today = date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s
    puts "Upcoming Games as of #{today}"
  end

  def game_list
    puts "1. Dragon Ball FighterZ"
    puts "2. The Inpatient"
  end

  def menu
    puts "Please select the game you want to know more about by number, or type exit to leave!"
    input = gets.strip
    if input == "1"
      puts "Dragon Ball FighterZ"
      puts "release date: January 26th, 2018"
      puts "platform(s): XOne, PS4"
      puts "genre: Fighting"
      puts "Want to look at more? Y/N?"
      response = gets.strip.upcase
      if response == "Y"
        call
      elsif response == "N"
        goodbye
      end
    elsif input == "2"
      puts "The Inpatient"
      puts "release date: January 23rd, 2018"
      puts "platform(s): PS4"
      puts "genre: VR horror"
      puts "Want to look at more? Y/N?"
      response = gets.strip.upcase
      if response == "Y"
        call
      elsif response == "N"
        goodbye
      end
    elsif input == "exit"
      goodbye
    end
  end

  def goodbye
    puts "Thanks for checking in, come back for more upcoming games!"
  end
end
