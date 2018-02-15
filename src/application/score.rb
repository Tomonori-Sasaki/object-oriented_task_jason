class Score
  attr_accessor :person, :point

  def initialize(person, point)
    @person = person
    @point = point
  end

  def self.all
    File.open($path) do |f|
      return JSON.load(f)
    end
  end

  def save
    file_exist
    results = Score.all
    results.store("#{person}", point)
    File.open($path, 'w') do |j|
      JSON.dump(results, j)
    end
  end

  def self.delete(line_num)
    results = all
    results.delete_if.with_index{|(k, v), i| i == line_num - 1}
    File.open($path, 'w') do |i|
      JSON.dump(results, i)
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
