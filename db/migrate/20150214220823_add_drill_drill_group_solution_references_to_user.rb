class AddDrillDrillGroupSolutionReferencesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :drill, index: true
    add_foreign_key :users, :drills
    add_reference :users, :solution, index: true
    add_foreign_key :users, :solutions
    add_reference :users, :drill_group, index: true
    add_foreign_key :users, :drill_groups
  end
end
