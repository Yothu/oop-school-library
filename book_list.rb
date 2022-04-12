require_relative 'book'

class BookList
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    title = new_string { 'Title: ' }
    author = new_string { 'Author: ' }

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

  def list_books_indexes
    puts 'Select a book from the following list by number'
    index = 0
    books.each do |book|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      index += 1
    end
  end
end
