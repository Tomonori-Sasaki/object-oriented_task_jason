class PersonValidator

  def self.invalid?(person)
    return true if person == ''
  end

  def self.message(person)
    return Print.error('>invalid input: should not be blank') if person == ''
  end

end
