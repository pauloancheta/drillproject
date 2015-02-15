class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :total_drills
      t.integer :correct_drills
      t.references :user, index: true
      t.references :drill_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :scorecards, :users
    add_foreign_key :scorecards, :drill_groups
  end
end
