require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, parent_permission, classroom = nil)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
