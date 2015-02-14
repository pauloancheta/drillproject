class CreateDrillGroups < ActiveRecord::Migration
  def change
    create_table :drill_groups do |t|
      t.string :name
      t.text :description
      t.integer :difficulty
      # t.references :admin, index: true

      t.timestamps null: false
    end
    # add_foreign_key :drill_groups, :admins
  end
end
