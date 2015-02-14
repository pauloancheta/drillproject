class Subscription < ActiveRecord::Base
  belongs_to :drill_group
  belongs_to :user

  # validates :drill_group_id, presence: true
  # validates :user_id, presence: true

end
