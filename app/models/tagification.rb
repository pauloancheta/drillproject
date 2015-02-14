class Tagification < ActiveRecord::Base
  belongs_to :tag
  belongs_to :drill_group
end
