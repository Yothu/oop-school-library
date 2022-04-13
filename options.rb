require './manage_books'
require './manage_persons'
require './manage_rentals'
require './save_data'
require './obtain_data'

class Options
  include SaveData
  include ObtainData

  attr_accessor :book_list, :rental_list, :person_list

  def initialize
    @book_list = BookList.new
    @rental_list = ManageRentals.new
    @person_list = ManagePerson.new
  end

  def books_and_persons_menus(option)
    book_list.print_books if option == 1
    person_list.list_persons if option == 2
    person_list.create_person if option == 3
    book_list.create_book if option == 4
  end

  def rentals_menus(option)
    rental_list.create_rental(book_list, person_list) if option == 5
    rental_list.list_rentals_by_person_id(person_list) if option == 6
  end

  def category_menu(menu_option)
    running = true
    if menu_option.positive? && menu_option <= 4
      books_and_persons_menus(menu_option)
    elsif menu_option >= 5 && menu_option <= 6
      rentals_menus(menu_option)
    elsif menu_option == 7
      running = false
      puts 'Thank you for using this app!'
    end
    running
  end
end
