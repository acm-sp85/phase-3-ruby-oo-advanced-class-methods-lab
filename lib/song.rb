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
    new_song= self.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end
  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    return new_song
  end
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) 
      return Song.find_by_name(name)
    else
      return Song.create_by_name(name)
    end
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

end
