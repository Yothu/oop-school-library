require 'json'
require './book'
require './teacher'
require './student'

module ObtainData
  def create_nonexistent_files
    files_names = ['persons.json', 'books.json', 'rentals.json']
    files_names.each do |file_name|
      File.new(file_name, 'w') unless File.exist?(file_name)
    end
  end

  def from_json_to_obj(line)
    JSON.parse(line)
  end

  def obtain_books
    file_path = 'books.json'
    if File.exist?(file_path)
      File.readlines(file_path).each do |line|
        book_data = from_json_to_obj(line)
        new_book = Book.new(book_data['title'], book_data['author'], book_data['id'])
        book_list.add_book(new_book)
      end
    else
      File.new('books.json', 'w')
    end
  end

  def obtain_persons
    file_path = 'persons.json'
    if File.exist?(file_path)
      File.readlines(file_path).each do |line|
        person_data = from_json_to_obj(line)
        case person_data['type']
        when 'Student'
          new_person = Student.new(person_data['age'], person_data['name'], person_data['parent_permission'],
                                   person_data['id'])
        when 'Teacher'
          new_person = Teacher.new(person_data['specialization'], person_data['age'], person_data['name'], true,
                                   person_data['id'])
        end
        person_list.add_person(new_person)
      end
    else
      File.new('persons.json', 'w')
    end
  end

  def obtain_data
    create_nonexistent_files
    obtain_books
    obtain_persons
    # obtain_rentals
  end
end
