class User < ApplicationRecord
  has_many :user_plants
  has_many :plants, through: :user_plants

  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
