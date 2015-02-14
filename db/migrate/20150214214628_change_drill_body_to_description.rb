class ChangeDrillBodyToDescription < ActiveRecord::Migration
  def change
  	rename_column :drills, :body, :description
  end
end
