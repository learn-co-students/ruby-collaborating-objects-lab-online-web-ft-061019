class Artist
    @@all = []

    attr_accessor :name, :songs
    
    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        @songs << song
    end

    def save
        @@all << self
        self
    end
    
    def self.find_or_create_by_name(name)
        self.new(name).tap {|artist| artist.save}
        artist = @@all.find{|artist| artist.name == name}
        !!artist ? artist : self.new(name)
    end

    def print_songs
        self.songs.each{|song| puts song.name}
    end

end