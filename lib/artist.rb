require 'pry'
class Artist
   #Keep track of all my artist instances 
   @@all = []

   attr_accessor :name, :songs

   def initialize(name)
      self.name = name
      self.songs = []
   end

   def save
      @@all << self
   end

   def self.create(name)
      new_artist = self.new(name)
      new_artist.save
      new_artist
   end

   def add_song(song_object)
      #binding.pry
      # song_object.artist = self
      self.songs << song_object
      #self.find ? song_object : self.save
   end

   def self.all
      @@all
   end

   def self.find(artist_name)
      @@all.find {|artist_object| artist_object.name == artist_name}
   end

   def self.find_or_create_by_name(artist_name)
      found = self.find(artist_name)
      #binding.pry
      found ? found : self.create(artist_name)
      #binding.pry
   end

   def print_songs
      self.songs.each {|song_object| puts song_object.name}
   end
end