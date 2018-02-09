class Action
  def initialize(action)
    @action = action
  end

  def judge
    case @action
    when 'create', 'read', 'delete', 'average'
      self.send(@action)
    else
      puts ">No Method Error"
    end
  end

  def create
    puts '>Please enter the person'
    person = $stdin.gets.chomp
    return puts '>invalid input: should not be blank' if person == ''
    puts '>Please enter the score'
    score = $stdin.gets
    return puts '>invalid input: not a number' if score !~ /^[0-9]+$/
    return puts '>invalid input: less than 100' if score.to_i > 100
    return puts '>invalid input: more than 0' if score.to_i < 0
    Score.new(person, score.to_i).save
    puts '>Successfully created score'
  end

  def read
    puts '>Show all score'
    Score.all.each_with_index do |(person, score), i|
      puts "#{i + 1}.#{person},#{score}"
    end
  end

  def delete
    puts '>Please enter delete line number'
    input = $stdin.gets.to_i
    Score.delete(input)
    puts '>Successfully deleted score'
  end

  def average
    puts ">Score Average: #{Score.average}"
  end

end
