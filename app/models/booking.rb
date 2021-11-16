class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :watch

  validates :start_date, :end_date, presence: true
end
