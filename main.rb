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

# Create a new instance of the App class

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts ' '
  number = 0
  while number != 7
    show_menu
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

main
