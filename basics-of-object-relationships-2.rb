require "pry"
class Song
  attr_accessor :artist, :name, :genre
  @@all = []

  def initialize(name, genre)
    @name = name
    @genre = genre

    save
  end

  def artist_name
    self.artist.name
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

  def add_song_by_name(name, genre)
    song = Song.new(name, genre)
    song.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
      # Validate artist_name instance method
      # song.artist_name
    end
  end
end

# ===========================================================
# Call add_song_by_name method with name and genre arguments 
# to create a real song object.
# Making the associations between an artist and his/her songs.
# -----------------------------------------------------------

theWeeknd = Artist.new("The Weeknd")

theWeeknd.add_song_by_name("Blinded By The Lights", "Pop Music")
theWeeknd.add_song_by_name("Too Late", "Alternative R&B")
theWeeknd.add_song_by_name("Heartless", "Pop Music")
theWeeknd.add_song_by_name("Snowchild", "Pop Music")

theWeeknd.songs.each do |song|
  p song.name
end

# binding.pry