class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date }
  validates :address, presence: true
  attribute :status, default: "pending"
end
