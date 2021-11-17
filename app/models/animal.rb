class Animal < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :photos
  validates :name, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :species, presence: true
  validates :description, presence: true
  validates :quality, presence: true
  # validates :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
