class ChageTypeOfMinutes < ActiveRecord::Migration
  def change
  	change_column :chores, :minutes, :string
  end
end
