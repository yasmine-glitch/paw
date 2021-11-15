class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
  attribute :status, default: "pending"
end
