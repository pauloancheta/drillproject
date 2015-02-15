class RemoveReferenceToLevelsFromDrills < ActiveRecord::Migration
  def change
    remove_foreign_key :drills, :levels
    remove_column :drills, :level_id
  end
end
