class Score
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def self.all
    File.open($path) do |f|
      return JSON.load(f)
    end
  end

  def save
    unless File.exist?($path)
      File.open($path,"w") do |file|
        file.puts '[]'
      end
    end
    File.open($path) do |i|
      @nums = JSON.load(i)
    end
    @nums << num
    File.open($path, 'w') do |j|
      JSON.dump(@nums, j)
    end
  end

  def self.delete(line_num)
    @nums = Score.all
    File.open($path, 'w') do |j|
      JSON.dump(@nums.delete_at(line_num), j)
    end
  end
end
