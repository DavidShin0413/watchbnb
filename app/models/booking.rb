class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :watch

  validates :start_date, :end_date, presence: true
  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
