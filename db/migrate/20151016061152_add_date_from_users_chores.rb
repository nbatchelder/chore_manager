class AddDateFromUsersChores < ActiveRecord::Migration
  def change
  	add_column :chores, :date, :date
  end
end
