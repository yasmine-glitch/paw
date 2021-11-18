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
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

# <!--Yas : START code searchbar animal address in animal model -->
  include PgSearch::Model
  pg_search_scope :search_by_address_species_name,
                  against: [:address, :species, :name],
                  using: {
                  tsearch: { prefix: true } # <-- now `14 rue Craspin du Gast` will return something!
                  }
# <!--Yas : END code searchbar animal address in animal model -->
end
