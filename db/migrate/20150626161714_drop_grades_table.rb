class DropGradesTable < ActiveRecord::Migration
  def down
    drop_table :grades
  end
end
