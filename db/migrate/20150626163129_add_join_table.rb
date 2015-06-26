class AddJoinTable < ActiveRecord::Migration
  def change
    create_table :students_achievements, id: false do |t|
      t.belongs_to :achievement, index: true
      t.belongs_to :student, index: true
    end
  end

end
