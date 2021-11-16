class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :price, :location, :img_url, presence: true
  validates :style, inclusion: { in: %w[dress diver pilot field] }
end
