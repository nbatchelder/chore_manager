class DropDateFromChores2 < ActiveRecord::Migration
  def change
  	remove_column :chores, :date
  end
end
