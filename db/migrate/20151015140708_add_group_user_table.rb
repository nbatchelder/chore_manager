class AddGroupUserTable < ActiveRecord::Migration
  def change
  	 create_table :group_user, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :user, index: true
    end
  end
end
