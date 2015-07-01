class ListItem < ActiveRecord::Base
	belongs_to :todo_list

	def complete?
		!completed_at.blank?
	end

	def self.incomplete_task
		where('completed_at is null')
	end

	def self.complete_task
		where('completed_at is not null')
	end
end
