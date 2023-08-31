require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(name, age, parent_permission, classroom: nil)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.member?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

# student = Student.new('John', 18, true, Classroom.new('Biology'))
# puts "#{student}"