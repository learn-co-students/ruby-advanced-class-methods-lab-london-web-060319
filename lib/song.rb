require 'pry'

class Song
  
  attr_accessor :name, :artist_name, :song

  # def name=(new_name)
  #   @name = new_name
  # end

  # def name
  #   @name
  # end
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #(or Song.new)
    #@@all << song
    #self.all << song
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name # @name = name check why is unnecessary##################
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save 
    return song 
  end

  def self.find_by_name(name)
    self.all.find do |song| 
      if song.name == name 
         return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    song_exists = self.find_by_name(name) 
      if song_exists
        return song_exists
      else
        self.create_by_name(name)
      end
  end
    
  ALPHABET = "abcdefghijklmnopqrstuvwxyz"

  def self.alphabetical
    self.all.sort_by do |song|
      song.name.split("").map do |letter|
        ALPHABET.index(letter.downcase)
      end
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    details = filename.chomp(".mp3").split(" - ")
    song.artist_name = details[0]
    song.name = details[1]
    return song
    end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end 

end
#  binding.pry