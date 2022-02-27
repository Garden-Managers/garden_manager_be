class Plant < ApplicationRecord
  has_many :user_plants
  has_many :users, through: :user_plants

  validates :name, :frost_date, :maturity, presence: true

  def self.name_search(query)
    Plant.where("name ilike ?", "%#{query}%")
  end 
end
