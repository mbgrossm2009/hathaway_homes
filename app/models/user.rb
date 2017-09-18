class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

has_many :listings


  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :trackable, :validatable

   after_create :welcome_send
   def welcome_send
     WelcomeMailer.welcome_send(self).deliver
   end

end
