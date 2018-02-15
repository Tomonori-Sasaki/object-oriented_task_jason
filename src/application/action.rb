class Action
  def initialize(action)
    @action = action
  end

  def judge
    case @action
    when 'create', 'read', 'delete', 'average', 'read_as_html'
      self.send(@action)
    else
      puts ">No Method Error"
    end
  end

  def create
    puts '>Please enter the person'
    person = $stdin.gets.chomp
    return PersonValidator.message(person) if PersonValidator.invalid?(person)
    puts '>Please enter the score'
    point = $stdin.gets
    return PointValidator.message(point) if PointValidator.invalid?(point)
    Score.new(person, point.to_i).save
    Print.success('>Successfully created score')
  end

  def read
    puts '>Show all score'
    Score.all.each_with_index do |(person, point), i|
      puts "#{i + 1}.#{person},#{point}"
    end
  end

  def delete
    puts '>Please enter delete line number'
    input = $stdin.gets.to_i
    Score.delete(input)
    Print.success('>Successfully deleted score')
  end

  def average
    puts ">Score Average: #{Score.average}"
  end

  def read_as_html
    Print.html('h2', '>Show all score')
    Score.all.each_with_index do |(person, point), i|
      Print.html('p', "#{i + 1}.#{person},#{point}")
    end
  end

end
