class RenameTaskToChore < ActiveRecord::Migration
  def change
     rename_table :tasks, :chores
   end 
end
