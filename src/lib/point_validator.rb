class PointValidator

  def self.invalid?(point)
    return true if point !~ /^[0-9]+$/ || point.to_i > 100 || point.to_i < 0
  end

  def self.message(point)
    return Print.error('>invalid input: not a number') if point !~ /^[0-9]+$/
    return Print.error('>invalid input: less than 100') if point.to_i > 100
    return Print.error('>invalid input: more than 0') if point.to_i < 0
  end

end
