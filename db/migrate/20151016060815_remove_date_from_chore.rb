class RemoveDateFromChore < ActiveRecord::Migration
  def change
  	remove_column :chores, :date
  end
end
