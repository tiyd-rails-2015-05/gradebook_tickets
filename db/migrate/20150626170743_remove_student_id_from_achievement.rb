class RemoveStudentIdFromAchievement < ActiveRecord::Migration
  def change
    remove_column :achievements, :student_id
  end
end
