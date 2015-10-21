class AddTimeFromChoresAttr < ActiveRecord::Migration
  def change
  	add_column :chores, :minutes, :integer
  end
end
