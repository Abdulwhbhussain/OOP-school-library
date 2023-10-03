require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book
    @book.rentals.push(self) unless @book.rentals.member?(self)
  end

  def person=(person)
    @person = person
    @person.rentals.push(self) unless @person.rentals.member?(self)
  end
end

# class Rental
#   attr_accessor :date, :book, :person

#   def initialize(date, person, book)
#     @person = person
#     person.rentals << self
#     @book = book
#     book.rentals << self
#     @date = date
#   end
# end
