class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token
      t.date :expires_at

      t.timestamps null: false
    end
  end
end
