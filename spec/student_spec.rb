require './student'
require './classroom'

describe Student do
  describe '#add_classroom' do
    it 'should add a classroom to the students array' do
      student = Student.new(15, 'John')
      classroom = Classroom.new('Math')
      student.add_classroom(classroom)
      expect(student.classroom).to eq classroom
    end
  end

  describe '#play_hooky' do
    it 'should return "¯\(ツ)/¯"' do
      student = Student.new(12, 'Paul')
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
