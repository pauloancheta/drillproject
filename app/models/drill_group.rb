class DrillGroup < ActiveRecord::Base
  belongs_to :admin
  has_many :drills, dependent: :destroy
  
  has_many :scorecards, dependent: :destroy
  has_many :users, through: :scorecards

  # Every :tag can have many :tagifications, which 
  # are destroyed when the :tag is destroyed
  has_many :tagifications, dependent: :destroy
  has_many :tags, through: :tagifications

  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :difficulty, presence: true


end
