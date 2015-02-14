class AddForeignKeysToSolution < ActiveRecord::Migration
  def change
    add_foreign_key :solutions, :drills
  end
end
