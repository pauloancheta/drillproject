class AddUserReferencesToDrills < ActiveRecord::Migration
  def change
    add_reference :drills, :user, index: true
    add_foreign_key :drills, :users
  end
end
