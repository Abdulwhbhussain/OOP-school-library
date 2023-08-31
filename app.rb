# App Console Entry Point
require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end
end

# case number
# when 1
#   puts 'Listing all books:'
#   puts ' '
#   puts Book.all
#   puts ' '
# when 2
#   puts 'Listing all people:'
#   puts ' '
#   puts Person.all
#   puts ' '
# when 3
#   puts 'Creating a person:'
#   puts ' '
#   puts 'Please enter the name of the person:'
#   name = gets.chomp
#   puts 'Please enter the age of the person:'
#   age = gets.chomp.to_i
#   puts 'Please enter the parent permission of the person:'
#   parent_permission = gets.chomp.to_i
#   person = Person.new(name: name, age: age, parent_permission: parent_permission)
#   puts "Person #{person.name} was created with id #{person.id}"
#   puts ' '
# when 4
#   puts 'Creating a book:'
#   puts ' '
#   puts 'Please enter the title of the book:'
#   title = gets.chomp
#   puts 'Please enter the author of the book:'
#   author = gets.chomp
#   book = Book.new(title: title, author: author)
#   puts "Book #{book.title} was created with id #{book.id}"
#   puts ' '
# when 5
#   puts 'Creating a rental:'
#   puts ' '
#   puts 'Please enter the person id:'
#   person_id = gets.chomp.to_i
#   puts 'Please enter the book id:'
#   book_id = gets.chomp.to_i
#   puts 'Please enter the date:'
#   date = gets.chomp
#   person = Person.find(person_id)
#   book = Book.find(book_id)
#   rental = Rental.new(date: date, book: book, person: person)
#   puts "Rental with id #{rental.id} was created"
#   puts ' '
# when 6
#   puts 'Listing all rentals for a given person id:'
#   puts ' '
#   puts 'Please enter the person id:'
#   person_id = gets.chomp.to_i
#   person = Person.find(person_id)
#   puts person.rentals
#   puts ' '
# when 7
#   puts 'Exiting...'
#   puts ' '
# else
#   puts 'Please enter a valid number'
#   puts ' '
# end
