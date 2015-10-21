class CreateUserChores < ActiveRecord::Migration
  def change
    create_table :user_chores do |t|
      t.integer :user_id
      t.integer :chore_id
      t.date :date

      t.timestamps null: false
    end
  end
end
