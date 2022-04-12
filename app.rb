require './book'
require './student'
require './teacher'
require './rental'

require './new_index'
require './user_input'
require './new_string'
require './new_y_n_response'
require './new_positive_number'

require './main_menu'
require './add_person_menu'

require './book_list'

require './manage_person'

# App class
class App
  attr_accessor :book_list, :rentals, :person_list

  def initialize
    @book_list = BookList.new
    @rentals = []
    @person_list = ManagePerson.new
  end

  def create_rental
    book_list.list_books_indexes
    book = book_list.return_books_array[new_index(book_list.return_books_array)]

    person_list.list_persons_indexes
    person = person_list.return_persons_array[new_index(person_list.return_persons_array)]

    date = new_string { 'Date: ' }

    new_rental = Rental.new(date, person, book)
    puts 'Rental created successfully' if new_rental.instance_of?(Rental)

    rentals << new_rental
  end

  def list_rentals_by_person_id
    person = person_list.person_by_id

    return unless person.instance_of?(Student) || person.instance_of?(Teacher)

    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def books_and_persons_menus(option)
    book_list.print_books if option == 1
    person_list.list_persons if option == 2
    person_list.create_person if option == 3
    book_list.create_book if option == 4
  end

  def rentals_menus(option)
    create_rental if option == 5
    list_rentals_by_person_id if option == 6
  end

  def options(menu_option)
    running = true
    if menu_option.positive? && menu_option <= 4
      books_and_persons_menus(menu_option)
    elsif menu_option >= 5 && menu_option <= 6
      rentals_menus(menu_option)
    elsif menu_option == 7
      running = false
    end
    running
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      menu_option = main_menu.to_i
      running = options(menu_option)

      puts 'Thank you for using this app!'
      break unless running
    end
  end
end
