# App Console Entry Point
require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/classroom'
require_relative 'classes/rental'
require_relative 'classes/base_decorator'
require_relative 'classes/capitalize_decorator'
require_relative 'classes/nameable'
require_relative 'classes/trimmer_decorator'
require_relative 'classes/teacher'
require_relative 'classes/student'

class App
  def run
    puts 'Welcome to School Library App!'
    puts ' '
    number = 0
    while number != 7
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      number = gets.chomp.to_i
      case number
      when 1
        puts 'List of books:'
      when 2
        puts 'List of people:'
      when 3
        puts 'Create a person:'
      when 4
        puts 'Create a book:'
      when 5
        puts 'Create a rental:'
      when 6
        puts 'List of rentals:'
      when 7
        puts 'Goodbye!'
      else
        puts 'Try again, please'
      end
    end    
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
