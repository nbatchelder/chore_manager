class Chore < ActiveRecord::Base

	validates_presence_of :name, :minutes, on: :update
	belongs_to :group
	has_many :user_chores

	validates :name, uniqueness: {scope: :group_id}
	validates :name, uniqueness: {scope: :minutes}
end
