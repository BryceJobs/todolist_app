class AddTodoListToListItem < ActiveRecord::Migration
  def change
    add_reference :list_items, :todo_list, index: true, foreign_key: true
  end
end
