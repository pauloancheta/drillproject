class RemoveAdminAddUsersToSolutions < ActiveRecord::Migration
  def change
    remove_column :solutions, :admin_id
    add_reference :solutions, :user, index: true
    add_foreign_key :solutions, :users
  end
end
