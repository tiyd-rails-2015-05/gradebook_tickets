class Assignment < ActiveRecord::Base
  has_many :grades
  belongs_to :teacher
  has_many :students, through: :grades
  accepts_nested_attributes_for :grades

  def average
    students = Student.where(teacher_id: self.teacher.id)
    num_students_with_grades = students.select{|s| s.has_grade?(self.id)}.count

    if num_students_with_grades > 0
      self.grades.sum(:score)/num_students_with_grades
    else
      "No scores yet"
    end

  end

  def assign
    students = Student.where(teacher_id: self.teacher_id)
    students.each do |s|
      Grade.create(student_id: s.id, assignment_id: self.id)
    end
  end

end
