class Score
  attr_accessor :person, :score

  def initialize(person, score)
    @person = person
    @score = score
  end

  def self.all
    File.open($path) do |f|
      return JSON.load(f)
    end
  end

  def save
    file_exist
    File.open($path) do |i|
      @results = JSON.load(i)
    end
    @results.store("#{person}", score)
    File.open($path, 'w') do |j|
      JSON.dump(@results, j)
    end
  end

  def self.delete(line_num)
    @results = Score.all
    @results.delete_if.with_index{|(k, v), i|
      i == line_num - 1
    }
    File.open($path, 'w') do |i|
      JSON.dump(@results, i)
    end
  end

  def self.average
    all.values.inject(:+).to_f/all.size
  end

  private

  def file_exist
    unless File.exist?($path)
      File.open($path,"w") do |file|
        file.puts '{}'
      end
    end
  end
end
