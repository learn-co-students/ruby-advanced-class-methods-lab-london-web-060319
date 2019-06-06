class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.select{|song| song if song.name==name}[0]
  end

  def self.find_or_create_by_name(name)
    existing_song = self.find_by_name(name)
    existing_song ? existing_song : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    song.artist_name, song.name = filename[/[^.]+/].split(" - ")
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    song.artist_name, song.name = filename[/[^.]+/].split(" - ")
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end

