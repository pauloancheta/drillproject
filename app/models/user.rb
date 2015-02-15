class User < ActiveRecord::Base
  has_secure_password

  # user has many subscriptions and their subscriptions are deleted
  # from the database if the user deletes their account
  has_many :subscriptions, dependent: :destroy
  has_many :drill_group_subscriptions, through: :subscriptions, source: :drill_group

  # :user has many :drills and upon deletion, :drills reference
  # to :user is nullified
  has_many :drills, dependent: :nullify

  # :user has many :drill_groups and upon deletion, :drill_groups
  # reference to :user is nullified
  has_many :drill_groups, dependent: :nullify

  # :user has many :solutions and upon deletion, :solutions 
  # reference to :user is nullified
  has_many :solutions, dependent: :nullify

  # :user has many :scorecards and upon deletion, :scorecards
  # are destroyed
  has_many :scorecards, dependent: :destroy
  has_many :attempted_drill_groups, through: :scorecards, source: :drill_group

  validates :email, presence: true, uniqueness: true,
            email_format: true

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      email
    end
  end



end
