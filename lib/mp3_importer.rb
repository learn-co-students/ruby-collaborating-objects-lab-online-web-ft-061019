class MP3Importer
    attr_accessor :path

    def initialize(path)
        self.path = path
    end 

    def files
        array = Dir.glob(path + "/*.mp3")
        array.map { |file| file.gsub(path + "/", "")}
    end 

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end 
    end 
end 