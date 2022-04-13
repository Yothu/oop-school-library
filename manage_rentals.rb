require './rental'
require './input'

class ManageRentals
  attr_accessor :rentals, :input

  def initialize
    @rentals = []
    @input = Input.new
  end

  def create_rental(book_list, person_list)
    book_list.list_books_indexes
    book = book_list.return_books_array[input.index(book_list.return_books_array)]

    person_list.list_persons_indexes
    person = person_list.return_persons_array[input.index(person_list.return_persons_array)]

    date = input.text { 'Date: ' }

    new_rental = Rental.new(date, person, book)
    puts 'Rental created successfully' if new_rental.instance_of?(Rental)

    rentals << new_rental
  end

  def add_rental(rental)
    rentals << rental
  end

  def list_rentals_by_person_id(person_list)
    person = person_list.person_by_id

    return unless person.instance_of?(Student) || person.instance_of?(Teacher)

    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
