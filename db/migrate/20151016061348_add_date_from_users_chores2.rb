class AddDateFromUsersChores2 < ActiveRecord::Migration
  def change
  	add_column :users_chores, :date, :date
  end
end
