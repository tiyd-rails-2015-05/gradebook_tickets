class Teacher < User
  has_many :students
  has_many :parents, through: :students

end
