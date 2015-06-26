class Student < ActiveRecord::Base
  has_many :grades
  has_many :parents
  belongs_to :teacher
  has_secure_password

  def has_grade?(assignment)
    grade = Grade.where(student_id: self.id).find_by_assignment_id(assignment)
    grade.score != nil
  end
end
