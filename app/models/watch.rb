class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :price, :location, :img_url, presence: true
  validates :style, inclusion: { in: %w[Dress Diver Pilot Field] }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
