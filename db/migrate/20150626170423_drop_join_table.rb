class DropJoinTable < ActiveRecord::Migration
  def change
    drop_table :students_achievements
  end
end
