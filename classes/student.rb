require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_writer :parent_permission

  def initialize(name, age, parent_permission, classroom = nil)
    super(name, age)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
