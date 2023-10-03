class Rental
  attr_accessor :book, :person, :date

  def initialize(date, person = nil, book = nil)
    @person = person
    @book = book
    @date = date
  end
end
