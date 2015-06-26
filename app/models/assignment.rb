class Assignment < ActiveRecord::Base
  has_many :grades
  belongs_to :teacher
  accepts_nested_attributes_for :grades

  def average
    students = Student.where(teacher_id: self.teacher.id)

    num_students = students.select{|s| s.has_grade?(self.id)}.count
    self.grades.sum(:score)/num_students

  end

  def assign
    students = Student.where(teacher_id: self.teacher.id)
    students.each do |s|
      Grade.create(student_id: s.id, assignment_id: self.id)
    end
  end

end
