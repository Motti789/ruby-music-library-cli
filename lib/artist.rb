class Artist
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

    def add_song(song)
      song.artist = self unless song.artist
    end

    def songs 
      Song.all.select { |s| s.artist == self }
    end

    def genres
      songs.collect{ |s| s.genre }.uniq
    end
 end 