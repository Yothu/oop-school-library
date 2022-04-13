describe Classroom do
  describe '#initialize' do
    it 'should be a Classroom object' do
      classroom = Classroom.new('English')
      expect(classroom).to be_a(Classroom)
    end
    it 'should have a label' do
      classroom = Classroom.new('English')
      expect(classroom.label).to eq('English')
    end
  end

  describe '#add_student' do
    it 'should add a student to the classroom' do
      classroom = Classroom.new('History')
      student = Student.new('Rort', 32)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
