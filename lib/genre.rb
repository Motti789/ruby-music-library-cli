class Genre
  extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end    

    def self.all
     @@all
    end 

    def save
     self.class.all << self
     self
    end 

    def self.destroy_all
     all.clear
    end

    def self.create(name)
      song = new(name)
      song.save
      song
    end

    def artists
      songs.collect{ |s| s.artist }.uniq
    end

    def songs 
      Song.all.select { |s| s.genre == self }
    end
  

end