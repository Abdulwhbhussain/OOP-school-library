require 'json'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end

  def to_json(option = {})
    {
      date: @date,
      book: @book,
      person: @person
    }.to_json(option)
  end
end
