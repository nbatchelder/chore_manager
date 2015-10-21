class AddHashToGroup < ActiveRecord::Migration
  def change
  	add_column :groups, :user_chore_hash, :text
  end
end
