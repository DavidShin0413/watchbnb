class Review < ApplicationRecord
  belongs_to :watch
  validates :comment, presence: true, length: { maximum: 255, too_long: "Maximum 255 characters allowed" }
  validates :rating, presence: true, inclusion: { in: 1..5, message: "should be from 1 to 5" }
end
