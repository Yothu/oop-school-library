require './person'

# Teacher Class
class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission = 'true', id = Time.now.to_f.to_s)
    super(age, name, parent_permission, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
