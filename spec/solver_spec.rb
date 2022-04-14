require_relative '../solver'

describe Solver do
  describe '#factorial' do
    it 'the factorial of 3 should be 6' do
      solver = Solver.new
      result = solver.factorial(3)

      expect(result).to eq(6)
    end
  end
end
