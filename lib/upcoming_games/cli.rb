#CLI controller
require "pry"
class UpcomingGames::CLI

  def call
    UpcomingGames::Games.scrape_upcoming_games
    greeting
    menu
  end

  def greeting
    date = Time.new
    today = date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s
    puts "******************************"
    puts "Upcoming Games as of #{today}"
    puts "******************************"
    UpcomingGames::Games.all.each.with_index(1) do |game, index|
      puts "#{index}. #{game.name}"
    end
  end

  def menu
    puts ""
    puts "Which game do you want to know more about?"
    puts ""
    puts "enter the game number, or exit to close the program."
    puts ""
    input = gets.strip
    game = UpcomingGames::Games.find(input.to_i)

    display_game(game)

    puts "Would you like to look at more games? Enter Y/N"
    input = gets.strip.upcase
      if input =="Y"
        greeting
        menu
      else
        puts "Thanks for checking in!"
      end
    end

  #def display_game_info(input)
    #UpcomingGames::Games.all.each.with_index(1) do |g, index|
      #if input == index.to_s
        #puts "***#{g.name}***"
        #puts "Release date: #{g.release_date}"
        #puts "Genre: #{g.genre}"
        #puts "Description: #{g.description}"
      #end
    #end
  #end

  def display_game(game)
    puts "***#{game.name}***"
    puts "Release date: #{game.release_date}"
    puts "Genre: #{game.genre}"
    puts "Description: #{game.description}"
  end

end
