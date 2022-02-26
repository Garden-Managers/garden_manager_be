class Plant < ApplicationRecord
  validates :name, :frost_date, :maturity, presence: true
end
