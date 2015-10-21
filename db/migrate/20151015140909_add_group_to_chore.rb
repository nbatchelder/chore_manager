class AddGroupToChore < ActiveRecord::Migration
  def change
    add_reference :chores, :group, index: true
  end
end
