class Tag < ActiveRecord::Base
  # Every :tag can have many :tagifications, which 
  # are destroyed when the :tag is destroyed
  has_many :tagifications, dependent: :destroy
  # Every :tag can have many :drill_groups through
  # the :tagifications association
  has_many :drill_groups, through: :tagifications

  # Ensures the tag's title exists, and is unique
  validates :title, presence: true, uniqueness: true
  # Ensures the tag's title is all lowercase and 
  # spaces are replaced with underscores
  before_validation :tag_styling

  private

  def tag_styling
    self.title = title.downcase.gsub(/\s/, '_')
  end

end
