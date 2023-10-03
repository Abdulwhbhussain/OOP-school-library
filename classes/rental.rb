class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end
end
