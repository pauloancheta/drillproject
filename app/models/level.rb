class Level < ActiveRecord::Base
  # Every :level requires a title
  validates :title, presence: true
end
