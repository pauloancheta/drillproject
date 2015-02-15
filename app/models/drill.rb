class Drill < ActiveRecord::Base

  belongs_to :drill_group
  belongs_to :level
  belongs_to :user

  # Every :drill can have many :solutions, which 
  # are destroyed when the :drill is destroyed
  has_many :solutions, dependent: :destroy

  # Make sure the title isn't empty
  validates :title, presence: true
  # Make sure the description isn't empty
  validates :description, presence: true
end
