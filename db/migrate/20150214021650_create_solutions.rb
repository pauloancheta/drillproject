class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :drill, index: true
      t.references :admin, index: true

      t.timestamps null: false
    end
    #add_foreign_key :solutions, :drills
    #add_foreign_key :solutions, :admins
  end
end
