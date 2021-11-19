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
  validates :photos, presence: true
  attribute :review, default: ""
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

# <!--Yas : START code searchbar in animal model -->
  include PgSearch::Model
  pg_search_scope :search_by_address_species_name,
                  against: [:address, :species, :name],
                  using: {
                  tsearch: { prefix: true } # <-- now `14 rue Craspin du Gast` will return something!
                  }
# <!--Yas : END code searchbar in animal model -->

# <!--Yas : START code méthode is_available? -->
def is_available?(start_date, end_date)
  start_date = Date.parse(start_date)
  end_date = Date.parse(end_date)
  if self.reservations.any?
    reservations = self.reservations
    booked_dates = []
    reservations.each do |reservation|
      reservations_dates = (reservation.start_date..reservation.end_date).to_a
      reservations_dates.each { |date| booked_dates << date }
    end
    final_booked_dates = booked_dates.uniq
    reservation_dates = (start_date..end_date).to_a
    final_booked_dates.each do |date|
      return false if reservation_dates.include?(date)
    end
  end
end
# <!--Yas : END code méthode is_available? -->

end
