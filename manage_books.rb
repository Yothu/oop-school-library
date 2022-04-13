require_relative 'book'
require_relative 'input'

class BookList
  attr_accessor :books, :input

  def initialize
    @books = []
    @input = Input.new
  end

  def return_books_array
    books
  end

  def create_book
    title = input.text { 'Title: ' }
    author = input.text { 'Author: ' }

    new_book = Book.new(title, author)

    puts 'Book created successfully' if new_book.instance_of?(Book)

    add_book(new_book)
  end

  def add_book(book)
    books << book unless books.include?(book)
  end

  def print_books
    books.each { |book| puts "Title: \"#{book.title}\", Author: \"#{book.author}\"" }
    puts
  end

  def return_by_id(id)
    books.each { |book| return book if book.id.to_s == id.to_s }
  end

  def list_books_indexes
    puts 'Select a book from the following list by number'
    index = 0
    books.each do |book|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      index += 1
    end
  end
end
