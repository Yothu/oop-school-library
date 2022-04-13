require './person'
require './book'

describe Person do
  describe '#initialize' do
    it 'should initialize a new person' do
      person = Person.new(12, 'Johnny')
      expect(person).to be_a Person
    end

    it 'should have a name' do
      person = Person.new(32, 'Johnny')
      expect(person.name).to be_a String
    end

    it 'should have an age' do
      person = Person.new(20, 'Johnny')
      expect(person.age).to be_a Integer
    end
  end

  describe '#of_age?' do
    it 'should return true if the person is of age' do
      person = Person.new(18, 'Johnny')
      expect(person.of_age?).to be true
    end

    it 'should return false if the person is not of age' do
      person = Person.new(17, 'Johnny')
      expect(person.of_age?).to be false
    end
  end

  describe '#can_use_services?' do
    it 'should return true if the person is of age or has a parent permission' do
      person = Person.new(16, 'Johnny')
      expect(person.can_use_services?).to be true
    end

    it 'should return false if the person is not of age and does not have a parent permission' do
      person = Person.new(16, 'Johnny', 'false')
      expect(person.can_use_services?).to be false
    end
  end

  describe '#add_rental' do
    it 'should add a rental to the rentals array' do
      person = Person.new(17, 'Johnny')
      book = Book.new('The Hobbit', 'Tolkien')
      person.add_rental('01/01/2017', book)
      expect(person.rentals.length).to eq 1
    end
  end
end
