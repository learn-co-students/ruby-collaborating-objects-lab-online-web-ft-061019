require 'pry'

class MP3Importer
   attr_accessor :path, :files

   def initialize(path)
      self.path = path
      #This line gets file information from the self.path, then iterates over 
      self.files = Dir.entries(self.path).delete_if {|song| song == "." || song == ".."}
      #binding.pry

   end

   def import
      self.files.each {|file| Song.new_by_filename(file)}
   end

end