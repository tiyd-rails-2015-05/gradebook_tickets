class ChangeJoinTable < ActiveRecord::Migration

  def down
    drop_table :students_achievements
  end

  def change
    create_table :achievements_students, id: false do |t|
      t.belongs_to :achievement, index: true
      t.belongs_to :student, index: true
    end
  end

end
