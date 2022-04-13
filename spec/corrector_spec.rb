require './capitalize_decorator'

describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'should capitalize the name' do
      nameable = Nameable.new('brian')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Brian')
    end
  end
end