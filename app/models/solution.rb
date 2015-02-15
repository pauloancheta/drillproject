class Solution < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :drill
  belongs_to :user
end
