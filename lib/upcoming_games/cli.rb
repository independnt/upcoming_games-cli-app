#CLI controller
require "pry"
class UpcomingGames::CLI

  def call
    UpcomingGames::Games.scrape_upcoming_games
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Welcome to upcoming Playstation 4 games, want to see some games?"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    input = gets.strip.downcase
    if input == "yes"
      greeting
      menu
    else
      puts "Fine. smell ya later!"
    end
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
    puts "Enter the number of the game for more info!"
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

  def display_game(game)
    puts ""
    puts "*************#{game.name}***************"
    puts ""
    puts "Release date: #{game.release_date}"
    puts "Genre: #{game.genre}"
    puts ""
    puts "--------------Description----------------"
    puts "#{game.description}"
    puts ""
  end

end
