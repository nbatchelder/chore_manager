class UserGroup < ActiveRecord::Base

	has_one :user
	has_one :group

	validates :user_id, uniqueness: {scope: :group_id}

	attr_accessor :group_id_value

end
