class Hospital < ApplicationRecord
  has_one_attached :image
  has_many :owners
end
