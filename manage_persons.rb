require './person'
require './student'
require './teacher'
require './input'

class ManagePerson
  attr_accessor :persons, :input

  def initialize
    @persons = []
    @input = Input.new
  end

  def return_persons_array
    persons
  end

  def list_persons
    persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts
  end

  def create_teacher
    age = input.natural_int { 'Age: ' }
    name = input.text { 'Name: ' }
    specialization = input.text { 'Specialization: ' }

    new_teacher = Teacher.new(specialization, age, name)
    puts 'Person created successfully' if new_teacher.instance_of?(Teacher)
    persons << new_teacher
  end

  def create_student
    age = input.natural_int { 'Age: ' }
    name = input.text { 'Name: ' }
    permission = input.y_n { 'Has parent permission? [Y/N]: ' }

    new_student = Student.new(age, name, permission)
    puts 'Person created successfully' if new_student.instance_of?(Student)
    persons << new_student
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    add_person_option = input.user_input
    case add_person_option
    when '1' # Student
      create_student
    when '2' # Teacher
      create_teacher
    end
  end

  def add_person(person)
    persons << person
  end

  def person_by_id
    print 'ID of person: '
    id = input.user_input
    persons.each { |person| return person if person.id.to_s == id.to_s }
  end

  def return_by_id(id)
    persons.each { |person| return person if person.id.to_s == id.to_s }
  end

  def list_persons_indexes
    puts 'Select a person from the following list by number (not id)'
    index = 0
    persons.each do |person|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      index += 1
    end
  end
end
