class Subscription < ActiveRecord::Base
  belongs_to :drill_group
  belongs_to :user

  validates :drill_group, presence: true, uniqueness: { scope: :user }
  validates :user, presence: true

end

