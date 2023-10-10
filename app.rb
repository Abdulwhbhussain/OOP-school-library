# App Console Entry Point
require 'json'
require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_data('books.json')
    @people = load_data('people.json')
    @rentals = load_data('rentals.json')
  end

  def books_list()
    display_items(@books, 'Books') { |book| "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def people_list()
    display_items(@people, 'People') do |person|
      "[#{person.class}] - Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def add_book()
    puts 'Creating a book:'
    title = get_user_input('Title: ')
    author = get_user_input('Author: ')
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    puts ' '
  end

  def add_student()
    puts 'Creating a student:'
    student = create_a_person(Student)
    @people.push(student)
    puts 'Student created successfully'
    puts ' '
  end

  def add_teacher()
    puts 'Creating a Teacher:'
    teacher = create_a_person(Teacher)
    @people.push(teacher)
    puts 'Teacher created successfully'
    puts ' '
  end

  def add_person()
    person_type = get_user_input('Do you want to create a student (1) or a teacher (2)? [Input the number]: ').to_i
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
    books_list
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    people_list
    person_index = gets.chomp.to_i
    person = @people[person_index]
    date = get_user_input('Date: ')
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts ' '
  end

  def rentals_of_person(id)
    person_rentals = @rentals.select { |rental| rental.person.id == id }
    display_items(person_rentals, 'Rentals') do |rental|
      "Date:  #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
  end

  def save(filename, data)
    File.write(filename, JSON.pretty_generate(data))
  end

  def save_data()
    # File.open("books.json", "w") { |f| f.puts @books.to_json }
    # File.open("people.json", "w") { |f| f.puts @people.to_json }
    # File.open("rentals.json", "w") { |f| f.puts @rentals.to_json }
    File.write('books.json', JSON.pretty_generate(@books))
    File.write('people.json', JSON.pretty_generate(@people))
    File.write('rentals.json', JSON.pretty_generate(@rentals))
  end

  def load_data(file)
    if File.exist?(file)
      test = JSON.parse(File.read(file))
    else
      []
    end
    test
  end
  private

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end

  def create_a_person(person_class)
    age = get_user_input('Age: ').to_i
    name = get_user_input('Name: ')
    if person_class == Student
      person = person_class.new(age, name)
      person.parent_permission = get_user_input('Has parent permission? [Y/N]: ').casecmp('Y').zero?
    elsif person_class == Teacher
      specialization = get_user_input('Specialization: ')
      person = person_class.new(age, name, specialization)
    else
      puts "Invalid person choice: #{person_class}"
    end
    person
  end

  def display_items(items, kind)
    if items.empty?
      puts "Record of #{kind}: 0 found "
    else
      puts "Listing all #{kind}:"
      items.each_with_index do |item, index|
        puts "#{index}) #{yield(item)}"
      end
      puts ' '
    end
  end

  
end

t = App.new
d = t.load_data('books.json')
puts d
puts d[0]['title']