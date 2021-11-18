class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :price, :location, :img_url, presence: true
  validates :style, inclusion: { in: %w[Dress Diver Pilot Field] }

<<<<<<< HEAD
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
=======
  include PgSearch::Model
  pg_search_scope :search_by_name_and_style,
    against: [ :name, :style ],
    using: {
      tsearch: { prefix: true }
    }
>>>>>>> 8621f4dc0e66bc84bb883b5a27009f82d32024a2
end
