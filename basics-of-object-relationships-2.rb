require "pry"
class Song
  attr_accessor :artist, :name, :genre

  def initialize(name, genre)
    @name = name
    @genre = genre
  end
end

class Artist 
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs.push(song)
  end

  def songs
    @songs
  end
end

# "Too late"
# "Heartless"
# "Snowchild"

theWeeknd = Artist.new("The Weeknd")

# ===========================================================
# Call add_song method with an argument of a real song object:
# -----------------------------------------------------------
blinded = Song.new("Blinded By The Lights", "Pop Music")
tooLate = Song.new("Too Late", "Alternative R&B")

theWeeknd.add_song(blinded)
theWeeknd.add_song(tooLate)

# ========================================================
# Collect all the genre.
# --------------------------------------------------------
all_genres = theWeeknd.songs.collect do |song|
  song.genre
end
# p all_genres

# binding.pry