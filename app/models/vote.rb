class Vote < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :user, uniqueness: { scope: :listing,
   message: "You are only allowed one vote" }

validates :user, :review, presence: true
end
