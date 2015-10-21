class DropUsersChoresTable < ActiveRecord::Migration
  def change
  	drop_table :users_chores
  end
end
