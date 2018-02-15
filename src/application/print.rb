class Print
  
  def self.success(msg)
    puts "\e[32m#{msg}\e[m"
  end

  def self.error(msg)
    puts "\e[31m#{msg}\e[m"
  end

  def self.html(tag, msg)
    puts "<#{tag}>#{msg}</#{tag}>"
  end

end
