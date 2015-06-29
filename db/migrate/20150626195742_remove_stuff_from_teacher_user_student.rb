class RemoveStuffFromTeacherUserStudent < ActiveRecord::Migration
  def change
    remove_column :students, :teacher_id
    remove_column :students, :created_at
    remove_column :students, :updated_at
    remove_column :parents, :student_id
    remove_column :parents, :created_at
    remove_column :parents, :updated_at
    remove_column :teachers, :created_at
    remove_column :teachers, :updated_at
  end
end
