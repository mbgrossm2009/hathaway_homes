class Downvote < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :review, uniqueness: { scope: :user,
   message: "You are only allowed one vote" }

validates :user, :review, presence: true
end
