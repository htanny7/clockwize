class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_many :events
end
