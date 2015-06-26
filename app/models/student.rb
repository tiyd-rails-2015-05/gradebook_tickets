class Student < ActiveRecord::Base
  has_and_belongs_to_many :achievements
  has_many :parents
  belongs_to :teacher
  has_secure_password
end
