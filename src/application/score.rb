class Score
  def self.write(num, way)
    File.open($path, way) do |f|
      f.puts num
    end
  end

  def self.to_array
    File.read($path).split("\n").map{|x| x.to_i}
  end
end
