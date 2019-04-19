class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :body, :phone_number
  validates :name, :email, :phone_number, :body, presence: true
  # has_many :listings
end
