require 'json'

module ManageFiles
  def create_nonexistent_files
    files_names = ['persons.json', 'books.json', 'rentals.json']
    files_names.each do |file_name|
      File.new(file_name, 'w') unless File.exist?(file_name)
    end
  end

  def transform_to_json(line)
    JSON.generate(line)
  end

  def save_persons
    File.truncate('persons.json', 0)
    person_list.persons.each do |person|
      line = if person.instance_of?(Student)
               { id: person.id,
                 type: person.class,
                 name: person.name,
                 age: person.age,
                 parent_permission: person.parent_permission,
                 rentals: person.return_rentals_ids }
             else
               { id: person.id,
                 type: person.class,
                 name: person.name,
                 age: person.age,
                 specialization: person.specialization,
                 rentals: person.return_rentals_ids }
             end

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

  def save_data
    create_nonexistent_files
    save_persons
    save_books
    save_rentals
  end
end
