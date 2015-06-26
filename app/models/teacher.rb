class Teacher < ActiveRecord::Base
  has_many :students
  has_many :parents, through: :students
  has_many :assignments
  has_secure_password

end
