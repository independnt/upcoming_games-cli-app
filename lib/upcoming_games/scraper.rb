class UpcomingGames::Scraper

  def self.scrape_upcoming_games
    doc = Nokogiri::HTML(open("http://www.ign.com/upcoming/games?platformSlug=ps4&sortBy=releaseDate&sortOrder=asc&time=3m"))
    games = doc.css("div.clear.itemList-item")
    games.each do |g|
      UpcomingGames::Games.new(
        g.css("h3 a").text.strip,
        g.css("div.releaseDate.grid_3.omega").text.strip,
        g.css("span.item-genre").text.strip,
        g.css(".item-title h3 a").first.attr("href")
      )
    end

  end

end
