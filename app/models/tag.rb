class Tag < ActiveRecord::Base

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
