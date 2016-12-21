class User < ApplicationRecord
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :posts
  has_many :likes
  validates :name, :alias, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: email_regex }
  validates :password,  presence: true
  before_save do
    self.email.downcase!
  end
end
