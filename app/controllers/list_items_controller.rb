class ListItemsController < ApplicationController
	before_action :set_todo_list
	def create
		
		@list_item = @todo_list.list_items.build(list_item_params)

		if @list_item.save
			redirect_to @todo_list, notice: 'Your list item was created'
		end

	end

	def destroy
		@todo_list.list_items.find(params[:id]).destroy
		redirect_to @todo_list, notice: 'List item was successfully destroyed'
	end

	def completed
		item = @todo_list.list_items.find(params[:id])
		item.completed_at = Time.now
		item.save
		redirect_to @todo_list, notice: "That's good so move ahead to your next task"
	end

	private

	def list_item_params
		params[:list_item].permit(:description, :completed_at, :todo_list_id)
	end

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

end
