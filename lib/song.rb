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
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(self.name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort do |x, y|
      x.name <=> y.name
    end
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    mp3_name = filename.split(" - ")[1]
    name = mp3_name.split(".")[0]
    song = self.new_by_name(name)
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    mp3_name = filename.split(" - ")[1]
    name = mp3_name.split(".")[0]
    song = self.create_by_name(name)
    song.artist_name = artist_name
    return song
  end

  def self.destroy_all
    self.all.clear
  end
end
