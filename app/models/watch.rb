class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :price, :location, :img_url, presence: true
  validates :style, inclusion: { in: %w[Dress Diver Pilot Field] }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_style,
    against: [ :name, :style ],
    using: {
      tsearch: { prefix: true }
    }
end
