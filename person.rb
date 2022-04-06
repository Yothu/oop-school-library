require './nameable'

# Person Class
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    super()
    @id = Time.now.to_i
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

  public :can_use_services?
  private :of_age?
end
