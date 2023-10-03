require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals.push(Rental.new(date, self, person))
  end
end


# class Book
#   attr_reader :rentals
#   attr_accessor :title, :author

#   def initialize(title, author)
#     @title = title
#     @author = author
#     @rentals = []
#   end

#   # def add_rental(rental)
#   #   @rentals << rental
#   #   rental.book = self
#   # end
# end
