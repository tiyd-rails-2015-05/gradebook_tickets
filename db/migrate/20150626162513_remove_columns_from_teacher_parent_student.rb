class RemoveColumnsFromTeacherParentStudent < ActiveRecord::Migration
  def change
    remove_column :teachers, :name
    remove_column :teachers, :email
    remove_column :teachers, :password_digest
    remove_column :parents, :name
    remove_column :parents, :email
    remove_column :parents, :password_digest
    remove_column :students, :name
    remove_column :students, :email
    remove_column :students, :password_digest
  end
end
