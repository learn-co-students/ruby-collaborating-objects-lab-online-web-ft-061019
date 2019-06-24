class Song
    attr_accessor :name, :artist, :genre
    def initialize(name)
        @name = name
    end

    def self.new_by_filename(file_name)
        # Operate on file name
        artist_name, song_name, song_genre = file_name.split(" - ")
        song_genre = song_genre.gsub(".mp3", "")
        # Create new song
        song = self.new(song_name)
        song.genre = song_genre
        # Find or create song_artist
        # Add song to artist
        song_artist = Artist.find_or_create_by_name(artist_name)
        song_artist.add_song(song)
        # Associate song with artist
        # Return new created song
        song.artist = song_artist
        song
    end
end
