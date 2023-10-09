require_relative 'app'

def show_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

class Choices
  def user_choices(number, app)
    case number
    when 1
      app.books_list
    when 2
      app.people_list
    when 3
      app.add_person
    when 4
      app.add_book
    when 5
      app.add_rental
    when 6
      print 'ID of person: '
      id = gets.chomp.to_i
      app.rentals_of_person(id)
    else
      puts 'Thank you for using the School Library App!'
    end
  end
end

# Create a new instance of the App class

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ' '
  number = 0
  while number != 7
    show_menu
    number = gets.chomp.to_i
    if number < 1 || number > 7
      puts 'Please enter a valid number'
      puts ' '
      next
    else
      Choices.new.user_choices(number, app)
    end
  end
end

main
