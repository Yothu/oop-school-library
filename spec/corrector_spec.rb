require './capitalize_decorator'
require './person'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'should capitalize the name' do
      person = Person.new(54, 'brian')
      decorator = CapitalizeDecorator.new(person)

      expect(decorator.correct_name).to eq('Brian')
    end
  end
end
