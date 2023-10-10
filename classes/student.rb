require 'json'
require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_writer :parent_permission

  def initialize(name, age, classroom = nil)
    super(age, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(option = {})
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }.to_json(option)
  end
end
