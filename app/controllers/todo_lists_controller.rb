class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
  	@todo_lists = TodoList.all
  end

  def new
  	@todo_list = TodoList.new
  end

  def edit
  end

  def show
  end

  def create
  	@todo_list = TodoList.new(todo_list_params)
  	respond_to do |format|
  		if @todo_list.save
  			format.html	{redirect_to @todo_list, notice: 'Your new Todo List is created'}
  		else
  			format.html {render 'new', alert: 'an unexpected error have happened'}
  		end
  	end
  end

  def update
  	if @todo_list.update_attributes(todo_list_params)
  		redirect_to @todo_list, notice: 'Your list is updated'
  	end
  end

  def destroy
  	if @todo_list.destroy
  		redirect_to todo_lists_path, notice: 'Your list was deleted'
  	end
  end

  private

  def todo_list_params
  	params[:todo_list].permit(:title, :description)
  end

  def set_todo_list
  	@todo_list = TodoList.find(params[:id])
  end
end
