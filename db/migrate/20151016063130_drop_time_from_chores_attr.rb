class DropTimeFromChoresAttr < ActiveRecord::Migration
  def change
  	remove_column :chores, :estimated_time
  end
end
