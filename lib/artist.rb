require "pry"

class Artist
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        self.name = name
        @songs = []
    end

    def add_song(song)
        self.songs.push(song)
    end

    def save
        @@all << self
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find { |artist| artist.name == name }
    end

    def self.create_by_name(name)
        # artist = Artist.new(name)
        # artist.save
        # artist
        self.new(name).tap { |artist| artist.save }
    end

    def self.find_or_create_by_name(name)
        if artist = self.find_by_name(name)
            artist
        else
            self.create_by_name(name)
        end
    end


end