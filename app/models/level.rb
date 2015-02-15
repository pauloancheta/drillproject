class Level < ActiveRecord::Base
  has_many :drill_groups, dependent: :nullify
  # Every :level requires a title
  validates :title, presence: true
end
