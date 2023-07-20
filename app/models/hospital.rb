class Hospital < ApplicationRecord
  has_one_attached :hospital_image
  has_many :owners

  has_many :clinical_department_managers, dependent: :destroy
  has_many :clinical_departments, through: :clinical_department_managers

end
