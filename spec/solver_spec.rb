require_relative '../solver'

describe Solver do
  describe '#factorial' do
    it 'the factorial of 3 should be 6' do
      solver = Solver.new
      result = solver.factorial(3)

      expect(result).to eq(6)
    end

    it 'the factorial of 2 should be 2' do
      solver = Solver.new
      result = solver.factorial(2)

      expect(result).to eq(2)
    end

    it 'the factorial of 1 should be 1' do
      solver = Solver.new
      result = solver.factorial(1)

      expect(result).to eq(1)
    end

    it 'the factorial of 0 should be 1' do
      solver = Solver.new
      result = solver.factorial(0)

      expect(result).to eq(1)
    end
    
    it 'A negative factorial should raise an execption' do
      subject = Solver.new
      expect { subject.factorial(-1) }.to raise_error(StandardError)
    end
  end

  describe '#reverse' do
    it 'Should return the reverse of Hello, olleh' do
      solver = Solver.new
      result = solver.reverse('hello')
      expect(result).to eq('olleh')
    end

    it 'should return the reverse of Aime' do
      solver = Solver.new
      result = solver.reverse('Aime')
      expect(result).to eq('emiA')
    end
  end
end
