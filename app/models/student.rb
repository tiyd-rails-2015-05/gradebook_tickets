class Student < ActiveRecord::Base
  has_many :achievements
  has_many :parents
  belongs_to :teacher
  has_secure_password
end
