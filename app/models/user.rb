class User < ActiveRecord::Base
  has_secure_password

  # user has many subscriptions and their subscriptions are deleted
  # from the database if the user deletes their account
  has_many :subscriptions, dependent: :destroy

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
