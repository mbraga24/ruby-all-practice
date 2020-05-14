require "pry"
class Song
  attr_accessor :artist, :name, :genre
  @@all = []

  def initialize(name, genre)
    @name = name
    @genre = genre

    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end

class Artist 
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end
end

# "Too late"
# "Heartless"
# "Snowchild"

theWeeknd = Artist.new("The Weeknd")

# ===========================================================
# Call add_song method with an argument of a real song object.
# Making the associations between an artist and his/her songs.
# -----------------------------------------------------------
blinded = Song.new("Blinded By The Lights", "Pop Music")
tooLate = Song.new("Too Late", "Alternative R&B")

theWeeknd.add_song(blinded)
theWeeknd.add_song(tooLate)

# ============================================================
# Making more associations between an artist and his/her songs
# ------------------------------------------------------------

heartless = Song.new("Heartless", "Pop Music")
snowchild = Song.new("Snowchild", "Pop Music")

snowchild.artist = theWeeknd
heartless.artist = theWeeknd

p theWeeknd.songs
# binding.pry