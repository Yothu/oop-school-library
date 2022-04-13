require './teacher'

describe Teacher do
  describe '#initialize' do
    it 'should create a new teacher' do
      teacher = Teacher.new('History', 45, 'Leslie')

      expect(teacher).to be_a Teacher
    end

    it 'should have a name and age' do
      teacher = Teacher.new('Physics', 32, 'Rort')

      expect(teacher.age).to eq 32
      expect(teacher.name).to eq 'Rort'
    end

    it 'should have a specialization' do
      teacher = Teacher.new('Math', 32, 'Mira')

      expect(teacher.specialization).to eq 'Math'
    end
  end

  describe '#can_use_services?' do
    it 'should always return true' do
      teacher = Teacher.new(16, 'Mickey', 'false')

      expect(teacher.can_use_services?).to be true
    end
  end
end
