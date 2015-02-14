class CreateTagifications < ActiveRecord::Migration
  def change
    create_table :tagifications do |t|
      t.references :tag, index: true
      t.references :drill_group, index: true

      t.timestamps null: false
    end
    add_foreign_key :tagifications, :tags
    add_foreign_key :tagifications, :drill_groups
  end
end
