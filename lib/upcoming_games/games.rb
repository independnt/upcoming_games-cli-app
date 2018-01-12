class UpcomingGames::Games

@@all = []

  attr_accessor :name, :release_date, :genre, :description, :url, :doc

  def initialize(name, release_date, genre, url)
    @name = name
    @release_date = release_date
    @genre = genre
    @url = url
  end


  def self.upcoming
    all.each.with_index(1) do |d, index|
      puts "#{index}. #{d.name}"
    end
  end

  def self.info
    game_1 = self.new
    game_1.name = "Dragon Ball FighterZ"
    game_1.release_date = "January 26, 2018"
    game_1.genre = "Fighting"
    game_1.description = "After the success of the Xenoverse series, its time to introduce a new classic 2D DRAGON BALL fighting game for this generations consoles. DRAGON BALL FighterZ is born from what makes the DRAGON BALL series so loved and famous: endless spectacular fights with its allpowerful fighters. Partnering with Arc System Works, DRAGON BALL FighterZ maximizes high end Anime graphics and brings easy to learn but difficult to master fighting gameplay to audiences worldwide."
    @@all << game_1
    game_2 = self.new
    game_2.name = "The Inpatient"
    game_2.release_date = "January 23, 2018"
    game_2.genre = "VR Horror"
    game_2.description = "Discover who you are before it’s too late in The Inpatient; a PS VR Exclusive set in the Blackwood Sanatorium, over 60 years prior to the 2016 BAFTA award-winning Until Dawn. With deep immersion that places YOU in the game, you take on the role of an amnesiac inpatient who must find out who you are and why you are in the Sanatorium. With a branching narrative, and different endings; every choice you make can drastically affect the way the game plays out. "
    @@all << game_2
end

  def self.all
    @@all
  end

  def self.new_from_page(g)
    title = doc.css(".item-title h3").css("a").map {|t| t.text.strip} #removes all white space and provides all names for games
    genre = doc.css("span.item-genre").map{|g| g.text.strip} #removes all white space and provides all genres for games
    release_date = doc.css("div.releaseDate.grid_3.omega").map{|r| r.text.strip}
    url = doc.css(".item-title h3 a").map{|u| "http://www.ign.com" + u['href']}
    testing = Nokogiri::HTML(open(url[20]))
    description = testing.css("div.gameInfo p").text.strip.gsub("\r\n", "")
  end

  def description_scraper
    doc = Nokogiri::HTML(open(self.url))
  end

  def doc
    @doc ||= Nokogiri::HTML(open("http://www.ign.com/upcoming/games?platformSlug=ps4&sortBy=releaseDate&sortOrder=asc&time=3m"))
  end
end
