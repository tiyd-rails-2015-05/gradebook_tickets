class Teacher < User
  has_many :students
  has_many :parents, through: :students
  has_many :assignments

end
