class DrillGroup < ActiveRecord::Base

  belongs_to :admin
  belongs_to :level
  belongs_to :user
  belongs_to :level

  # Every :drill_group can have many :drills
  has_many :drills, dependent: :destroy
  
  has_many :scorecards, dependent: :destroy
  has_many :users, through: :scorecards

  # Every :drill_group can have many :tagifications, which 
  # are destroyed when the :drill_group is destroyed
  has_many :tagifications, dependent: :destroy
  has_many :tags, through: :tagifications

  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  # validates :level, presence: true


end
