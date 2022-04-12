require './person'
require './student'
require './teacher'

class ManagePerson
  attr_accessor :persons

  def initialize
    @persons = []
  end

  def return_persons_array
    persons
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

  def person_by_id
    print 'ID of person: '
    id = user_input
    persons.each { |person| return person if person.id == id.to_i }
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
