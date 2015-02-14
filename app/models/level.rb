class Level < ActiveRecord::Base
  # Every :level can have many :drills; when a :level
  # is deleted, nullify the :drill's :level reference
  has_many :drills, dependent: :nullify

  has_many :drill_groups, dependent: :nullify

  # Every :level requires a title
  validates :title, presence: true
end
