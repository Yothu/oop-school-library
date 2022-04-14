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

    it 'should return the reverse of "Node.js is different from Ruby on Rails"' do
      solver = Solver.new
      result = solver.reverse('Node.js is different from Ruby on Rails')
      expect(result).to eq('sliaR no ybuR morf tnereffid si sj.edoN')
    end
  end

  describe '#fizzbuzz' do
    it 'should return fizz when gets a 3' do
      solver = Solver.new
      result = solver.fizzbuzz(3)

      expect(result).to eql('fizz')
    end

    it 'should return buzz when gets a 5' do
      solver = Solver.new
      result = solver.fizzbuzz(5)

      expect(result).to eql('buzz')
    end

    it 'should return fizzbuzz when gets a 15' do
      solver = Solver.new
      result = solver.fizzbuzz(15)

      expect(result).to eql('fizzbuzz')
    end
  end
end
