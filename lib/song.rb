require 'pry'

class Song 

    attr_accessor :name, :artist 

    @@all = []

    def self.all
        @@all
    end

def initialize(name)
    @name = name
    @@all << self 
end

def artist_name=(name)
    # Either we have to create that `Artist` instance, or
    #  it already exists and we have to find that `Artist` instance.
    #self.artist
    #find_or_create_by_name assign to song.artist
    self.artist = Artist.find_or_create_by_name(name) #-- class method self.find but need to put Artist instead of self
    self.artist.add_song(self)
end

#[Michael Jackson, - Black or White - pop.mp3] #mj to be saved some other variable 
#name = black + white ... then then take mj var and associate song.artist to var 

#artist_name == will take artist string and make array from string 
def self.new_by_filename(file)
    song_arr = file.split(' - ')
    artist = song_arr[0]
    song_name = song_arr[1]
    new_instance_song = Song.new(song_name)
    new_instance_song.artist_name = artist #artist_name = artist 
    # binding.pry
    new_instance_song
end

end