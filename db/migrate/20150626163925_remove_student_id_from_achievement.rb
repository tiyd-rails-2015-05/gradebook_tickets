class RemoveStudentIdFromAchievement < ActiveRecord::Migration

  def down
    remove_column :achievements, :student_id
  end

end
