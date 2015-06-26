class Student < User
  has_many :grades
  has_many :parents
  belongs_to :teacher
end
