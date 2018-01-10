#CLI controller
class UpcomingGames::CLI

  def call
    puts "----------------------------"
    greeting
    puts "----------------------------"
  end

  def greeting
    date = Time.new
    today = date.month.to_s + "/" + date.day.to_s + "/" + date.year.to_s
    puts "Upcoming Games for #{today}"
  end

end
