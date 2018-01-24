class UpcomingGames::Games

@@all = []

  attr_accessor :name, :release_date, :genre, :description, :url

  def initialize(name, release_date, genre, url)
    @name = name
    @release_date = release_date
    @genre = genre
    @url = url
    @@all << self
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

  def game_description_doc
    @game_description_doc ||= Nokogiri::HTML(open("http://www.ign.com#{self.url}"))
  end

end
