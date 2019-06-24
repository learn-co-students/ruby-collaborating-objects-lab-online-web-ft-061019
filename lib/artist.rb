class Artist
    attr_accessor :name, :songs
    @@all = []
    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        song.artist = self
        self.songs << song
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find_or_create_by_name(artist_name)
        artist = self.all.find { |artist|  artist.name == artist_name  }

        if artist.nil?
            new_artist = self.new(artist_name)
            new_artist.save
            artist = new_artist
        end

        artist

    end
    def print_songs
        self.songs.each {|song| puts song.name}
    end
end