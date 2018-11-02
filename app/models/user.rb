class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  has_many :mylistings
  has_many :reviews
  has_many :votes

  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :trackable, :validatable


end
