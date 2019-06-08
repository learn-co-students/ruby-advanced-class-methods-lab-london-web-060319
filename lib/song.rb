require 'pry'
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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !!find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
    song.name
    end
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ")
    artist_file = new_file[0]
    name_file = new_file[1].split(".")
    new_song = self.create
    new_song.name = name_file[0]
    new_song.artist_name = artist_file
    new_song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_file = new_file[0]
    name_file = new_file[1].split(".")
    new_song = self.create
    new_song.name = name_file[0]
    new_song.artist_name = artist_file
    @@all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
  #binding.pry
end
