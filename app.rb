# App Console Entry Point
require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/rental'
require_relative 'classes/classroom'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def books()
    puts 'Listing all books:'
    puts ' '
    @books.each do |book|
      puts 'Title: "' + book.title + '", Author: ' + book.author
    end
    puts ' '
  end

  def people()
    puts 'Listing all people:'
    puts ' '
    @people.each do |person|
      puts "#{person.class} - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ' '
  end

  def add_book()
    puts 'Creating a book:'
    puts ' '
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    puts ' '
  end

  def add_student()
    puts 'Creating a student:'
    puts ' '
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.upcase
    if permission == 'Y'
      permission = true
    else
      permission = false
    end
    puts 'testing before student creation'
    student = Student.new(name, age, permission)
    puts 'testing after student creation'
    @people.push(student)
    puts 'Student created successfully'
    puts ' '
  end

  def add_teacher()
    puts 'Creating a Teacher:'
    puts ' '
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people.push(teacher)
    puts 'Teacher created successfully'
    puts ' '
  end

  def add_person()
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    
    case person_type
    when 1
      add_student()
    when 2
      add_teacher()
    else
      puts 'Please enter a valid number'
    end
  end

  def add_rental()
    puts 'Creating a rental:'
    puts ' '
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts ' '
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
    puts ' '
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts ' '
  end

  def rentals_of_person(id)
    person_rentals = @rentals.select { |rental| rental.person.id == id }
    puts 'Rentals: '
    person_rentals.each do |rental|
      puts 'Date: ' + rental.date + ', Book "' + rental.book.title + '" by ' + rental.book.author
    end
    puts ' '
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
