require './nameable'
require './person'

# Base Decorator Class

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Prepare CapitalizeDecorator and TrimmerDecorator

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    return @nameable.correct_name.slice(0, 10) if @nameable.correct_name.size > 10

    @nameable.correct_name
  end
end

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalize_person = CapitalizeDecorator.new(person)
puts capitalize_person.correct_name
trimmer_person = TrimmerDecorator.new(person)
puts trimmer_person.correct_name