class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, :price, :location, presence: true
  validates :style, inclusion: { in: %w[Dress Diver Pilot Field] }


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_style,
    against: [ :name, :style ],
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range.first, to: range.last }
    end
  end

end
