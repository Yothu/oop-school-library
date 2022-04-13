require './book'
require './person'
require './rental'

describe Book do
  describe '#initialize' do
    it 'should create initialize a new book' do
      book = Book.new('The Fall', 'Marc Laid')

      expect(book).to be_a Book
    end

    it 'should have a title and author' do
      book = Book.new('A white road', 'Fer Von Amer')

      expect(book.title).to eq 'A white road'
      expect(book.author).to eq 'Fer Von Amer'
    end
  end

  describe '#add_rental' do
    it 'should add a rental to the rentals array' do
      book = Book.new('The Universe', 'Isaac Asimov')
      person = Person.new(47, 'Miluzaus')

      book.add_rental('29/02/2001', person)

      expect(book.rentals.length).to eq 1
    end
  end

  describe '#return_rentals_ids' do
    it 'should return an array of rental ids' do
      book = Book.new('Advanced Javascript', 'Me')
      person = Person.new(12, 'Me')

      book.add_rental('01/12/2010', person)

      expect(book.return_rentals_ids).to be_a Array
    end
  end
end
