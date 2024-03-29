class User < ApplicationRecord
  validates_presence_of :name
  validates :email, uniqueness: true
  #validates_uniqueness_of :email

  has_secure_password
end
