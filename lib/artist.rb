require 'pry'
class Artist
   #Keep track of all my artist instances 
   @@all = []

   attr_accessor :name, :songs

   def initialize(name)
      self.name = name
      self.songs = []
      self.save
   end

   def save
      @@all << self
   end

   def add_song(song_object)
      song_object.artist = self
      self.songs << song_object
   end

   def self.all
      @@all
   end

   def self.find_or_create_by_name(artist_name)
      is_found = @@all.find {|artist_object| artist_object.name == artist_name}
      #binding.pry
      is_found ? is_found : self.new(artist_name)
   end

   def print_songs
      self.songs.each {|song_object| puts song_object.name}
   end
end