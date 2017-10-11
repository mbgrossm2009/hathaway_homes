class Review < ApplicationRecord
  belongs_to :user, optional: true
  has_many :votes
  has_many :downvotes
end
