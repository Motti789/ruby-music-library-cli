class Song

    attr_accessor :name 
    attr_reader :artist

    @@all = []

    def initialize(name, artist = nil)
        @name = name
        @artist = artist
    end    

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
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
      songs.push song unless songs.include?(song)
    end 
end    