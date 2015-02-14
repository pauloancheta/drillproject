class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.string :title
      t.text :body
      #t.references :drill_group, index: true
      #t.references :admin, index: true

      t.timestamps null: false
    end
    #add_foreign_key :drills, :drill_groups
    #add_foreign_key :drills, :admins
  end
end
