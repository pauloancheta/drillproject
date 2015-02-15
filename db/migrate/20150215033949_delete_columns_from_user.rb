class DeleteColumnsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :drill_id
    remove_column :users, :solution_id
    remove_column :users, :drill_group_id
  end
end
