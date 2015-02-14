class Drill < ActiveRecord::Base
  # belongs_to :drill_group
  # belongs_to :admin

  # Make sure the title isn't empty
  validates :title, presence: true
  # Make sure the body isn't empty
  validates :body, presence: true
end
