require 'json'
require './book'
require './teacher'
require './student'

module ManageFiles
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

  def transform_to_json(line)
    JSON.generate(line)
  end

  def preapare_person_line(person)
    line = { id: person.id,
             type: person.class,
             name: person.name,
             age: person.age }
    line['parent_permission'] = person.parent_permission if person.instance_of?(Student)
    line['specialization'] = person.specialization if person.instance_of?(Teacher)
    line
  end

  def save_persons
    File.truncate('persons.json', 0)
    person_list.persons.each do |person|
      line = preapare_person_line(person)
      json_line = transform_to_json(line)
      File.write('persons.json', "#{json_line}\n", mode: 'a')
    end
  end

  def save_books
    File.truncate('books.json', 0)
    book_list.books.each do |book|
      line = { id: book.id,
               title: book.title,
               author: book.author,
               rentals: book.return_rentals_ids }

      json_line = transform_to_json(line)
      File.write('books.json', "#{json_line}\n", mode: 'a')
    end
  end

  def save_rentals
    File.truncate('rentals.json', 0)
    rental_list.rentals.each do |rental|
      line = { id: rental.id,
               date: rental.date,
               person: rental.person.id,
               book: rental.book.id }
      json_line = transform_to_json(line)
      File.write('rentals.json', "#{json_line}\n", mode: 'a')
    end
  end

  def obtain_data
    obtain_books
    obtain_persons
  end

  def save_data
    create_nonexistent_files
    save_persons
    save_books
    save_rentals
  end
end

# rentals: person.return_rentals_ids
