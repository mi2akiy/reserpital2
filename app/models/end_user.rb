class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations, dependent: :destroy
  has_many :hospitals, through: :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
