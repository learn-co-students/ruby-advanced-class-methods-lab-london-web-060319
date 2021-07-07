class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end
  # def artist_name(name)
  #   @artist_name = name
  # end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    # @@all.find do(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  if  self.find_by_name(name) == nil
   self.create_by_name(name)
  else 
    self.find_by_name(name)
  end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    # new_song = Song.new
    # new_song.name = name
    # @@all << new_song
    # new_song
    file_array = file_name.split(" - ")
    file_array2 = file_array[1].split(".")

    # new_song = Song.new
    song_name =  (file_array2[0])
    artist_name = file_array[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

def self.create_from_filename(file_name)
  file_array = file_name.split(" - ")
  file_array2 = file_array[1].split(".")

  # new_song = Song.new
  song_name =  (file_array2[0])
  artist_name = file_array[0]
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  @@all << song
end

def self.destroy_all
  @@all = []
end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
