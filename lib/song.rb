class Song 
  attr_accessor :name, :artist 
  
  def initialize(name)
    @name = name 
  end 
  
  def import
    files.each do |file|
      Song.new_by_filename(file)
    end
  end
def self.new_by_filename(file)
    artist_name, song_name = file.split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name)
    song.artist = artist
    artist.add_song(song)
    song
 end

end 