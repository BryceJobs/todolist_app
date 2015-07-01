class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :description
      t.timestamp :completed_at

      t.timestamps null: false
    end
  end
end
