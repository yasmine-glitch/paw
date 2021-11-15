class Animal < ApplicationRecord
  belongs_to :user
  belongs_to :species
  has_many :reservations
  validates :name, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
