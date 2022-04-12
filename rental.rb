# Rental class
class Rental
  attr_accessor :date, :person, :book, :id

  def initialize(date, person, book, id = Time.now.to_f.to_s)
    @id = id
    @date = date

    @person = person
    person.rentals << self unless person.rentals.include?(self)

    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end
end
