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

  def books_list()
    puts 'Listing all books:'
    puts ' '
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts ' '
  end

  def people_list()
    puts 'Listing all people:'
    puts ' '
    @people.each do |person|
      puts "[#{person.class}] - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
    permission = (permission == 'Y')
    student = Student.new(name, age, permission)
    student.parent_permission = permission
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
      add_student
    when 2
      add_teacher
    else
      puts 'Please enter a valid number'
    end
  end

  def add_rental()
    puts 'Creating a rental:'
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    person = @people[person_index]
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
      puts "Date:  #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
    puts ' '
  end
end
