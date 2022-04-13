require './person'

# Student Class
class Student < Person
  attr_accessor :classroom

  def initialize(age, name = 'Unknown', parent_permission = 'true', id = Time.now.to_f.to_s)
    super(age, name, parent_permission, id)
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  public :play_hooky
end
