require './nameable'
require './rental'

# Person Class
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission = 'true', id = Time.now.to_f.to_s)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission == 'true'

    false
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def return_rentals_ids
    ids = []
    rentals.each { |rental| ids << rental.id }
    ids
  end
end
