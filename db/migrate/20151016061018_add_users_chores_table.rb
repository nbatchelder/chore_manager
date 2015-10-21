class AddUsersChoresTable < ActiveRecord::Migration
   def change
  	 create_table :users_chores, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :chores, index: true
    end
  end
end
