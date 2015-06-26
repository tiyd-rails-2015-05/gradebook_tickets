class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :student_id
      t.string :name
      t.integer :amount

      t.timestamps null: false
    end
  end
end
