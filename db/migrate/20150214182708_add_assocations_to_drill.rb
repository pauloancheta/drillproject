class AddAssocationsToDrill < ActiveRecord::Migration
  def change
    add_reference :drills, :drill_group, index: true
    add_foreign_key :drills, :drill_groups
  end
end
