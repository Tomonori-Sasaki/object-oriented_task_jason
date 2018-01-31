class Action
  def create
    puts '>Please enter the score'
    input = $stdin.gets
    return puts '>invalid input: not a number' if input !~ /^[0-9]+$/
    return puts '>invalid input: less than 100' if input.to_i > 100
    return puts '>invalid input: more than 0' if input.to_i < 0
    Score.new(input.to_i).save
    puts '>Successfully created score'
  end

  def read
    puts '>Show all score'
    Score.all.each_with_index do |num, i|
      puts "#{i + 1}.#{num}"
    end
  end

  def delete
    puts '>Please enter delete line number'
    input = $stdin.gets.to_i
    Score.delete(input)
    puts '>Successfully deleted score'
  end

  def average
    puts ">Score Average: #{Score.all.inject(0.0){|sum, i| sum += i }/Score.all.size}"
  end
end
