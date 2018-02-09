class Print
  def self.green(msg)
    puts "\e[32m#{msg}\e[m"
  end

  def self.red(msg)
    puts "\e[31m#{msg}\e[m"
  end

  def self.html(tag, msg)
    puts "<#{tag}>#{msg}</#{tag}>"
  end

end
