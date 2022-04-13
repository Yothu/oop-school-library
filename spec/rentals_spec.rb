describe Rental do
  describe '#initialize' do
    it 'should be a Rental object' do
      person = Person.new(32, 'Brian')
      book = Book.new('Java', 'Marion')
      rental = Rental.new('13/04/2022', person, book)
      expect(rental).to be_a(Rental)
    end
    it 'should have a date' do
      person = Person.new(32, 'Lisa')
      book = Book.new('The Hobbit', 'Miguel')
      rental = Rental.new('12/5/2022', person, book)
      expect(rental.date).to eq('12/5/2022')
    end
    it 'should have a person' do
      person = Person.new(32, 'Barbara')
      book = Book.new('The Hobbit', 'James')
      rental = Rental.new('01/01/2022', person, book)
      expect(rental.person.name).to eq('Barbara')
    end
    it 'should have a book' do
      person = Person.new(32, 'Julia')
      book = Book.new('The white rose', 'Claudia')
      rental = Rental.new('12/12/2022', person, book)
      expect(rental.book.title).to eq('The white rose')
    end
  end
end
