class Song
  attr_accessor :title, :artist

  def initialize(title)
    @title = title
  end
end

class Artist
  attr_accessor :name, :genre

  def initialize(name, genre)
    @name = name
    @genre = genre
  end
end

artist = Artist.new("The Weeknd", "R&B/Soul")
track_1 = Song.new("Blinded By The Lights")
p track_1.title

track_1.artist = artist
p track_1.artist.name
p track_1.artist.genre