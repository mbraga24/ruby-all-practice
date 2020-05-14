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
    @songs << song
    song.artist = self
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
# Call add_song method with an argument of a real song object.
# Making the associations between artists and their many songs.
# -----------------------------------------------------------
blinded = Song.new("Blinded By The Lights", "Pop Music")
tooLate = Song.new("Too Late", "Alternative R&B")

theWeeknd.add_song(blinded)
theWeeknd.add_song(tooLate)

# ========================================================
# Collect all the genre.
# --------------------------------------------------------
all_genre = theWeeknd.songs.collect do |song|
  song.genre
end
# p all_genre

# ========================================================
# Checking the associations between songs and its artist.
# --------------------------------------------------------
p blinded.artist.name
p tooLate.artist.name

# binding.pry