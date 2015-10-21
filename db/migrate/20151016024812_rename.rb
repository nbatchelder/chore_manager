class Rename < ActiveRecord::Migration
  def change
  	rename_table :group_user, :groups_users
  end
end
