class AddLevelReferenceToDrillGroup < ActiveRecord::Migration
  def change
    add_reference :drill_groups, :level, index: true
    add_foreign_key :drill_groups, :levels
  end
end
