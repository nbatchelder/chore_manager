require 'date'
class Group < ActiveRecord::Base

	has_many :user_groups, :dependent => :delete_all
	has_many :chores, :dependent => :delete_all
	accepts_nested_attributes_for :chores, allow_destroy: true
	serialize :user_chore_hash, Hash


	def members
		my_user_groups = UserGroup.where(group_id: id)
		to_return = []
		my_user_groups.each do |user_group|
			to_return << User.find_by(id: user_group.user_id)
		end
		return to_return
	end

	def member_names
		to_return = []
		members.each do |member|
			to_return << member.full_name
		end
		return to_return
	end

	def key_of_least_minutes chore_hash
		if not chore_hash.empty?
		  return_key = chore_hash.keys[0]
		  return_minutes = Float::INFINITY
		  chore_hash.each do |user_id, chores|
		    minute_sum = 0
		    chores.each do |chore|
		      minute_sum += chore.minutes.to_i
		    end
		    if minute_sum < return_minutes
		    	return_key = user_id
		    	return_minutes = minute_sum
		    end
		  end
		  puts "MINUTE SUM"
		  puts return_minutes
		end
		return return_key
	end

	def find_smallest_chore chore_array
		smallest_chore = chore_array[0]
		smallest_minutes = Float::INFINITY

		chore_array.each do |chore|
			if chore.minutes.to_i < smallest_minutes
				smallest_minutes = chore.minutes
				smallest_chore = chore
			end
			return smallest_chore
		end
	end


	def assign_chores
		if not members.empty? and not chores.empty?
			to_return = Hash.new
			chores_by_time = (chores.to_a.sort! { |a,b| a.minutes.to_i<=> b.minutes.to_i }).reverse
			
			random_members = members.shuffle

			random_members.each do |member|
				to_return[member.id] = []
			end

			puts to_return

			chores_by_time.each_with_index do |chore, i|
				if not to_return.empty?
				  user_id = key_of_least_minutes to_return
				else
				  user_id = random_members[0].id
				end
				user_chore = UserChore.new({:date => DateTime.now, :user_id => user_id, :chore_id => chore.id})
				user_chore.save

				to_return[user_id] << chore
			
				puts to_return
			end
		end
		self.user_chore_hash =  to_return
		save
		puts "HOLA"
		puts to_return
	end


end
