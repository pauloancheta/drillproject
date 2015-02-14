class Scorecard < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill_group

  validates :user_id, presence: true
  validates :drill_group_id, presence: true
  validates :total_drills, presence: true
  validates :correct_drills, presence: true
end