class Hospital < ApplicationRecord
  has_one_attached :hospital_image
  has_many :owners
  has_many :clinical_departments

  def get_hospital_image(width, height)
    hospital_image.variant(risize_to_limit: [width, height]).processed
  end
end
