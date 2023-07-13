class Hospital < ApplicationRecord
  has_one_attached :image
  has_many :owners
  has_many :clinical_departments
end
