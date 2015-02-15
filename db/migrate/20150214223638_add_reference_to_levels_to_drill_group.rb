class AddReferenceToLevelsToDrillGroup < ActiveRecord::Migration
  def change
    remove_column :drill_groups, :difficulty
    add_reference :drill_groups, :level, index: true
    add_foreign_key :drill_groups, :levels
  end
end
