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
  end
end

artist_1 = Artist.new("The Weeknd")
track_1 = Song.new("Blinded By The Lights", "Pop Music")
p track_1.name
p track_1.genre
track_1.artist = artist_1
binding.pry