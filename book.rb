# Book class
class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = Time.now.to_f.to_s
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def return_rentals_ids
    ids = []
    rentals.each { |rental| ids << rental.id }
    ids
  end
end
