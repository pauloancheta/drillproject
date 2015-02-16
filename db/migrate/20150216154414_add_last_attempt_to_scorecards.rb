class AddLastAttemptToScorecards < ActiveRecord::Migration
  def change
    add_column :scorecards, :last_attempted_drill_id, :integer
  end
end
