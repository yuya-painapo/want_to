# CreateFollows model
class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false

      t.timestamps null: false

      t.index :from_user_id
      t.index :to_user_id
      t.index [:from_user_id, :to_user_id], unique: true
    end
  end
end
