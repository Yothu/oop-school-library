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

# App class
class App
  attr_accessor :books, :rentals, :persons

  def initialize
    @books = []
    @rentals = []
    @persons = []
  end

  def list_books
    books.each { |book| puts "Title: \"#{book.title}\", Author: \"#{book.author}\"" }
    puts
  end

  def list_persons
    persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts
  end

  def create_teacher
    age = new_positive_number { 'Age: ' }
    name = new_string { 'Name: ' }
    specialization = new_string { 'Specialization: ' }

    new_teacher = Teacher.new(specialization, age, name)
    puts 'Person created successfully' if new_teacher.instance_of?(Teacher)
    persons << new_teacher
  end

  def create_student
    age = new_positive_number { 'Age: ' }
    name = new_string { 'Name: ' }
    permission = new_y_n_response { 'Has parent permission? [Y/N]: ' }

    new_student = Student.new(age, name, permission)
    puts 'Person created successfully' if new_student.instance_of?(Student)
    persons << new_student
  end

  def create_person
    add_person_option = add_person_menu
    case add_person_option
    when '1' # Student
      create_student
    when '2' # Teacher
      create_teacher
    end
  end

  def create_book
    title = new_string { 'Title: ' }
    author = new_string { 'Author: ' }

    new_book = Book.new(title, author)

    puts 'Book created successfully' if new_book.instance_of?(Book)

    books << new_book
  end

  def list_books_indexes
    puts 'Select a book from the following list by number'
    index = 0
    books.each do |book|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      index += 1
    end
  end

  def list_persons_indexes
    puts 'Select a person from the following list by number (not id)'
    index = 0
    persons.each do |person|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      index += 1
    end
  end

  def create_rental
    list_books_indexes
    book = books[new_index(books)]

    list_persons_indexes
    person = persons[new_index(persons)]

    date = new_string { 'Date: ' }

    new_rental = Rental.new(date, person, book)
    puts 'Rental created successfully' if new_rental.instance_of?(Rental)

    rentals << new_rental
  end

  def person_by_id
    print 'ID of person: '
    id = user_input
    persons.each { |person| return person if person.id == id.to_i }
  end

  def list_rentals_by_person_id
    person = person_by_id

    return unless person.instance_of?(Student) || person.instance_of?(Teacher)

    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def books_and_persons_menus(option)
    list_books if option == 1
    list_persons if option == 2
    create_person if option == 3
    create_book if option == 4
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
