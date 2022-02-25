class User < ApplicationRecord
  validates :name, :email, :password_digest, :zip, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
