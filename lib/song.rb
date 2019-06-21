require 'pry'

class Song
   #to keep track of all songs from all artists 
   @@all = []

   #each song will have a name, artist, and genre 
   attr_accessor :name, :artist, :genre

   def initialize(name)
      self.name = name
   end

   def self.new_by_filename(filename)
      #binding.pry
      artist, song_name, genre = filename.split(" - ")
      genre.gsub(".mp3", "")

      #now i have artist name, song_name, and a cleaned up genre.  Need to create a new song 
      new_song = Song.new(song_name)
      #new_song.artist = artist   NEEDS TO BE AN OBJECT 
      new_song.genre = genre
   end

end