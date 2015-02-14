class AddLevelsReferencesToDrills < ActiveRecord::Migration
  def change
    add_reference :drills, :level, index: true
    add_foreign_key :drills, :levels
  end
end
