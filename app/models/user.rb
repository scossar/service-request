class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password, length: { minimum: 6 }
  validates :email, :uniqueness => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
