class AddAssignmentIdAchievement < ActiveRecord::Migration

  def up
    add_column :achievements, :assignment_id, :integer
  end

end
