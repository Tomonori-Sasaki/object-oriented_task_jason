class Action
  def create
    puts '>Please enter the score'
    input = $stdin.gets
    return puts '>invalid input: not a number' if input !~ /^[0-9]+$/
    return puts '>invalid input: less than 100' if input.to_i > 100
    return puts '>invalid input: more than 0' if input.to_i < 0
    Score.write(input, 'a')
    puts '>Successfully created score'
  end

  def read
    File.open($path).each_with_index do |line, index|
      puts "#{index + 1}." + line
    end
  end

  def delete
    puts '>Please enter delete line number'
    input = $stdin.gets.to_i
    File.open($path,'w'){|file| file = nil} if Score.to_array.count == 1
    Score.to_array.select.with_index{|e, j| j != input - 1}.each_with_index do |num, k|
       k == 0 ? Score.write(num, 'w') : Score.write(num, 'a')
    end
    puts '>Successfully deleted score'
  end

  def average
    puts ">Score Average: #{Score.to_array.inject(0.0){|sum, i| sum += i }/Score.to_array.size}"
  end
end
