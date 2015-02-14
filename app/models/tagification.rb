class Tagification < ActiveRecord::Base
  belongs_to :tag
  belongs_to :drill_group

  # Every :tagification requires a :tag and a :drill_group
  validates :tag, presence: true
  validates :drill_group, presence: true
end
