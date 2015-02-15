class AddUserToDrillGroup < ActiveRecord::Migration
  def change
    add_reference :drill_groups, :user, index: true
    add_foreign_key :drill_groups, :users
  end
end
