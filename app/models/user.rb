class User < ActiveRecord::Base

	has_many :user_groups, :dependent => :delete_all
	has_many :user_chores

		# Validations
 	validates_presence_of :email, :firstname, :lastname, :username
  	validates :email, format: { with: /(.+)@(.+).[a-z]{2,4}/, message: "%{value} is not a valid email" }
  	validates :username, length: { minimum: 3 }
  	validates_uniqueness_of :username


	# Use secure passwords
	has_secure_password

	# Find a user by email, then check the username is the same
	def self.authenticate username, password
		user = User.find_by(username: username)
		if user && user.authenticate(password)
			return user
		else
			return nil
		end
	end

	def full_name
		firstname + ' ' + lastname
	end

	def my_groups
		my_user_groups = UserGroup.where(user_id: id)
		to_return = []
		my_user_groups.each do |user_group|
			to_return << Group.find(user_group.group_id)
		end
		return to_return
	end

	def search_weight query
		weight = 0
		query.split(/\s+/).each do |query_word|
			if (query_word.downcase == firstname.downcase) || (query_word.downcase == lastname.downcase)
				weight += 1
			end
		end
		return weight
	end
end
