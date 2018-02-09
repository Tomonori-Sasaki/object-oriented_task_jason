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
    return Print.red('>invalid input: should not be blank') if person == ''
    puts '>Please enter the score'
    score = $stdin.gets
    return Print.red('>invalid input: not a number') if score !~ /^[0-9]+$/
    return Print.red('>invalid input: less than 100') if score.to_i > 100
    return Print.red('>invalid input: more than 0') if score.to_i < 0
    Score.new(person, score.to_i).save
    Print.green('>Successfully created score')
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
    Print.green('>Successfully deleted score')
  end

  def average
    puts ">Score Average: #{Score.average}"
  end

  def read_as_html
    Print.html('h2', '>Show all score')
    Score.all.each_with_index do |(person, score), i|
      Print.html('p', "#{i + 1}.#{person},#{score}")
    end
  end

end
