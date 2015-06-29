class Student < ActiveRecord::Base
  has_and_belongs_to_many :achievements
  has_many :parents
  belongs_to :teacher
  has_secure_password

  def incomplete_achievements
    incomplete = []
    completed = achievements.map {|a| a.id}
    all_achievements = Achievement.all
    all_achievements.each do |a|
      unless completed.include?(a.id)
        incomplete << a
      end
    end
    incomplete
  end

  def total
    all = achievements.map {|a| a.amount}
    all.reduce(:+)
  end

end
