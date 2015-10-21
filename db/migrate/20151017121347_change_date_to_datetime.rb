class ChangeDateToDatetime < ActiveRecord::Migration
  def change
  	change_column :user_chores, :date, :datetime
  end
end
