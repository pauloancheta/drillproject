class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :drill_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :subscriptions, :drill_groups
  end
end
