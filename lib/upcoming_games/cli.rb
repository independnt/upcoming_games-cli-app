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
      puts "Release date: January 26th, 2018"
      puts "Platform(s): XOne, PS4"
      puts "Genre: Fighting"
      puts "Description: After the success of the Xenoverse series, its time to introduce a new classic 2D DRAGON BALL fighting game for this generations consoles. DRAGON BALL FighterZ is born from what makes the DRAGON BALL series so loved and famous: endless spectacular fights with its allpowerful fighters. Partnering with Arc System Works, DRAGON BALL FighterZ maximizes high end Anime graphics and brings easy to learn but difficult to master fighting gameplay to audiences worldwide. "
      puts "Want to look at more? Y/N?"
      response = gets.strip.upcase
      if response == "Y"
        call
      elsif response == "N"
        goodbye
      end
    elsif input == "2"
      puts "The Inpatient"
      puts "Release date: January 23rd, 2018"
      puts "Platform(s): PS4"
      puts "Genre: VR horror"
      puts "Description: Discover who you are before it’s too late in The Inpatient; a PS VR Exclusive set in the Blackwood Sanatorium, over 60 years prior to the 2016 BAFTA award-winning Until Dawn. With deep immersion that places YOU in the game, you take on the role of an amnesiac inpatient who must find out who you are and why you are in the Sanatorium. With a branching narrative, and different endings; every choice you make can drastically affect the way the game plays out."
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
