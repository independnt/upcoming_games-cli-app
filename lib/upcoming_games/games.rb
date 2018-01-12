class UpcomingGames::Games

@@all = []

  attr_accessor :name, :release_date, :genre, :description, :url, :doc

  def initialize(name, release_date, genre, url)
    @name = name
    @release_date = release_date
    @genre = genre
    @url = url
    @@all << self
  end

  def self.new_from_page(g)
    self.new(
    g.css("h3 a").text.strip,
    g.css("div.releaseDate.grid_3.omega").text.strip,
    g.css("span.item-genre").text.strip,
    g.css(".item-title h3 a").first.attr("href")
    )
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def description
    @description ||= game_description_doc.css("div.gameInfo p").text.strip.gsub("\r\n", "")
  end

    def self.scrape_upcoming_games
      doc = Nokogiri::HTML(open("http://www.ign.com/upcoming/games?platformSlug=ps4&sortBy=releaseDate&sortOrder=asc&time=3m"))
      games = doc.css("div.clear.itemList-item")
      games.each do |g|
        UpcomingGames::Games.new_from_page(g)
      end
    end

    def game_description_doc
      @game_description_doc ||= Nokogiri::HTML(open("http://www.ign.com#{self.url}"))
    end

    def doc
    @doc ||= Nokogiri::HTML(open(self.url))
    end

end
