class Zpid < ApplicationRecord
  validates :zpid, presence: true

  has_many :listings


end
