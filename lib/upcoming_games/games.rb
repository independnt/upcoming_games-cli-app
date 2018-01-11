class UpcomingGames::Games

@@all = []

  attr_accessor :name, :release_date, :genre, :platform, :description

  def self.upcoming
    @@all.each.with_index(1) do |d, index|
      puts "#{index}. #{d.name}"
    end
  end

  def self.info
    game_1 = self.new
    game_1.name = "Dragon Ball FighterZ"
    game_1.release_date = "January 26, 2018"
    game_1.genre = "Fighting"
    game_1.platform = "Xone, PS4"
    game_1.description = "After the success of the Xenoverse series, its time to introduce a new classic 2D DRAGON BALL fighting game for this generations consoles. DRAGON BALL FighterZ is born from what makes the DRAGON BALL series so loved and famous: endless spectacular fights with its allpowerful fighters. Partnering with Arc System Works, DRAGON BALL FighterZ maximizes high end Anime graphics and brings easy to learn but difficult to master fighting gameplay to audiences worldwide."
    @@all << game_1
    game_2 = self.new
    game_2.name = "The Inpatient"
    game_2.release_date = "January 23, 2018"
    game_2.genre = "VR Horror"
    game_2.platform = "PS4"
    game_2.description = "Discover who you are before it’s too late in The Inpatient; a PS VR Exclusive set in the Blackwood Sanatorium, over 60 years prior to the 2016 BAFTA award-winning Until Dawn. With deep immersion that places YOU in the game, you take on the role of an amnesiac inpatient who must find out who you are and why you are in the Sanatorium. With a branching narrative, and different endings; every choice you make can drastically affect the way the game plays out. "
    @@all << game_2
end

  def self.all
    @@all
  end

end
