require 'pry'

class Song
   #to keep track of all songs from all artists 
   @@all = []

   #each song will have a name, artist, and genre 
   attr_accessor :name, :artist, :genre

   def initialize(name)
      self.name = name
      @@all << self
   end

   def self.new_by_filename(filename)
      artist, song_name, genre = filename.split(" - ")
      genre.gsub!(".mp3", "")
      #binding.pry
      #now i have artist name, song_name, and a cleaned up genre.  Need to create a new song 
      new_song = Song.new(song_name)
      new_song.genre = genre
      new_song.artist = Artist.find_or_create_by_name(artist)
      new_song.artist.songs << new_song
      new_song
   end

   def self.all
      @@all
   end
end