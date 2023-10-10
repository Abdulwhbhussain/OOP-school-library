require 'json'
require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization = 'Unknown')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(option = {})
    {
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }.to_json(option)
  end
end
