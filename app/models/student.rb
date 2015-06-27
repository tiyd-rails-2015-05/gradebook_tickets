class Student < User
  has_many :grades
  has_many :parents
  belongs_to :teacher

  def has_grade?(assignment)
    grade = Grade.where(student_id: self.id).find_by_assignment_id(assignment)
    grade && grade.score != nil
  end

  def get_grade(id)
    grades.find_by_assignment_id(id).score
  end
end
