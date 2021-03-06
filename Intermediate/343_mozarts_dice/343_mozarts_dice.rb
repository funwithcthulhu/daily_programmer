#!/Users/thomasboeding/.rubies/ruby-2.4.2/bin/ruby

# Song.new(filename) creates a new song based on "Mozart's Dice"
class Song
  def initialize(song_name)
    @song_name = song_name
    @source = []
    @possibilities = []
    @measures = []
    @song = []
    read_file
    read_possibilities
    get_measures
    make_song
    realign_measures
    write_song
  end

  def read_file
    File.open("mozart-dice-starting.txt").each_line do |line|
      @source << line.split(/\s+/)
    end
  end

  def read_possibilities
    File.open("mozarts-system.txt").each_line do |line|
      temp = line.split(/\s+/).map(&:to_i)
      @possibilities << temp
    end
  end

  def get_measures
    dice = Dice.new
    @possibilities.each_index do |i|
      @measures << @possibilities[i][dice.roll + dice.roll - 2]
    end
  end

  def make_song
    @measures.each do |measure|
      l = measure * 3
      temp = @source.select { |m| m[1].to_i >= (l-3) && m[1].to_i < l }
      temp.each { |a| @song << a }
    end
  end

  def realign_measures
    j = 0.0
    temp = @song[0][1]
    @song.size.times do |i|
      if @song[i][1] != temp
        temp = @song[i][1]
        j += if @song[i][1] =~ /(\.5)/ || j.to_s =~ /(\.5)/
               0.5
             else
               1
             end
      end
      @song[i][1] = j.to_s
    end
  end

  def write_song
    File.open(@song_name + '.txt', 'a') do |file|
      @song.each do |line|
        file.puts(line.join(' '))
      end
    end
  end
end

# overkill dice object for creating random numbers
class Dice
  attr_reader :value
  
  def roll
    @value = 1 + rand(5)
  end
end

Song.new(ARGV[0])
